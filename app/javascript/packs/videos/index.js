document.addEventListener('DOMContentLoaded', () => {
  const videos = document.getElementsByClassName('video');

  function convertIso8601(iso8601) {
    // moment.jsを利用してISO8601 durationをmm:ssに変換
    let moment = require('moment');
    let momentDuration = moment.duration(iso8601, moment.ISO_8601);
    let m = momentDuration.minutes();
    let s = ('00' + momentDuration.seconds()).slice(-2);
    return m + ':' + s
  }

  // 各動画のタイトルと再生時間を取得して表示する
  for (let i = 0; i < videos.length; i++) {
    // 各動画のyoutube動画IDを取得
    let youtube_id = videos[i].dataset.youtube;
    // youtube data apiのエンドポイント
    let url = `https://www.googleapis.com/youtube/v3/videos?id=${youtube_id}&key=${gon.youtube_api_key}&part=snippet, contentDetails&fields=items(snippet(title), contentDetails(duration))`;
    fetch(url)
      .then(response => response.json())
      .then(data => {
        let youtubeTitle = data['items'][0]['snippet']['title'];
        let iso8601Duration = data['items'][0]['contentDetails']['duration'];
        let duration = convertIso8601(iso8601Duration);
        // Youtube動画のタイトルを表示
        videos[i].children[0].innerText = youtubeTitle;
        // Youtube動画の再生時間を表示
        videos[i].children[1].innerText = duration;
      })
  }
})
