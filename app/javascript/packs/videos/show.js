document.addEventListener('DOMContentLoaded', () => {
  const video = document.getElementById('video');
  const youtube_id = video.dataset.youtube;
  const titleElement = document.getElementById('title');
  const durationElement = document.getElementById('duration');
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const url = `https://www.googleapis.com/youtube/v3/videos?id=${youtube_id}&key=${gon.youtube_api_key}&part=snippet, contentDetails&fields=items(snippet(title), contentDetails(duration))`
  let videoSeconds;

  function convertIso8601(iso8601) {
    // moment.jsを利用してISO8601 durationをmm:ssに変換
    let moment = require('moment');
    let momentDuration = moment.duration(iso8601, moment.ISO_8601);
    let m = momentDuration.minutes();
    let s = ('00' + momentDuration.seconds()).slice(-2);
    return m + ':' + s
  }

  function iso8601ToSeconds(iso8601) {
    // moment.jsを利用してISO8601 durationを秒数に変換
    let moment = require('moment');
    let momentDuration = moment.duration(iso8601, moment.ISO_8601);
    return momentDuration.asSeconds();
  }

  // 動画のタイトルと再生時間を取得して表示する
  fetch(url)
    .then(response => response.json())
    .then(data => {
      const iso8601Duration = data['items'][0]['contentDetails']['duration'];
      const youtubeTitle = data['items'][0]['snippet']['title'];
      const duration = convertIso8601(iso8601Duration);
      // 動画の秒数を後でcontrollerに送るので保存
      videoSeconds = iso8601ToSeconds(iso8601Duration);
      // Youtube動画のタイトルを表示
      titleElement.innerText = youtubeTitle;
      // Youtube動画の再生時間を表示
      durationElement.innerText = duration;
    })

  // scriptタグを生成
  const tag = document.createElement('script');
  // IFrame Player API JavaScriptを読み込める様に編集
  tag.src = "https://www.youtube.com/iframe_api";
  const firstScriptTag = document.getElementsByTagName('script')[0];
  // html上に設置
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  const startButton = document.getElementById('start-button');
  const FinishButton = document.getElementById('finish-button');
  const notes = document.getElementById('notes');
  const closeButton = document.getElementById('close-button');
  const modal = document.getElementById('modal');

  // IFrame Player API JavaScriptコードの読み込みが終わったら、埋め込み用の動画を自動生成
  let player;
  window.onYouTubeIframeAPIReady = function () {
    player = new YT.Player('player', {
      height: '180',
      width: '320',
      videoId: youtube_id,
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });
  }

  // 「再生する」をタップすると動画が再生される
  function onPlayerReady(event) {
    startButton.addEventListener('click', () => {
      event.target.playVideo();
    });
  }

  // 完了ボタンを押せるようにする
  function FinishButtonActive() {
    FinishButton.disabled = false;
    FinishButton.classList.remove('bg-white');
    FinishButton.classList.add('font-bold', 'text-white', 'bg-yellow-500');
  }

  let start = false;
  let finish = false;
  // 動画プレーヤーの状態が変化したときに、呼び出される
  function onPlayerStateChange(event) {
    // 動画が再生された2分後に完了ボタンを押せるようにする
    if (event.data == YT.PlayerState.PLAYING && !start) {
      setTimeout(FinishButtonActive, 120000);
      start = true;
    }
    // 動画が終了したらvideoFinish関数が動く
    if (event.data === YT.PlayerState.ENDED && !finish) {
      videoFinish();
    }
  }

  // 「完了する」をタップするとvideoFinish関数が動く
  FinishButton.addEventListener('click', () => {
    videoFinish();
  })

  // ajax処理で、どんぐりの個数や活動記録を更新する
  function videoFinish() {
    const body = `duration=${videoSeconds}`;
    const request = new Request('/activity', {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
        'X-CSRF-Token': token
      },
      method: 'PATCH',
      body: body
    }
    );
    fetch(request)
      .then(response => response.json())
      .then(data => {
        if (data['status'] === 200) {
          modal.classList.add('scale-100');
          FinishButton.remove();
          notes.remove();
          finish = true;
        } else {
          throw new Error('statusError');
        }
      })
      .catch(() => {
        swal('エラーが発生しました');
      })
  }

  closeButton.addEventListener('click', () => {
    modal.classList.remove('scale-100');
  })

})
