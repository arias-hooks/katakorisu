document.addEventListener('DOMContentLoaded', () => {
  const video = document.getElementById('video');
  const youtube_id = video.dataset.youtube;
  const titleElement = document.getElementById('title');
  const durationElement = document.getElementById('duration');
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const url = `https://www.googleapis.com/youtube/v3/videos?id=${youtube_id}&key=${gon.youtube_api_key}&part=snippet, contentDetails&fields=items(snippet(title), contentDetails(duration))`
  let videoSeconds;
  fetch(url)
    .then(response => response.json())
    .then(data => {
      const rawDuration = data['items'][0]['contentDetails']['duration']
      const h = /^PT([0-9]+)H/.exec(rawDuration) ? `${/^PT([0-9]+)H/.exec(duration)[1]}:` : ''
      const m = /([0-9]+)M/.exec(rawDuration) ? `${/([0-9]+)M/.exec(rawDuration)[1]}:` : '00:'
      const s = /([0-9]+)S$/.exec(rawDuration) ? /([0-9]+)S$/.exec(rawDuration)[1].padStart(2, '0') : '00'
      const title = data['items'][0]['snippet']['title']
      const duration = `${h}${m}${s}`
      const a = duration.split(':');
      if (a.length === 3) {
        videoSeconds = (a[0] * 60 * 60 | 0) + (a[1] * 60 | 0) + (a[2] | 0);
      } else {
        videoSeconds = (a[0] * 60 | 0) + (a[1] | 0)
      }
      titleElement.innerText = title
      durationElement.innerText = duration
    })

  const tag = document.createElement('script');
  tag.src = "https://www.youtube.com/iframe_api";
  const firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  const startButton = document.getElementById('start-button');
  const FinishButton = document.getElementById('finish-button');
  const notes = document.getElementById('notes');
  const closeButton = document.getElementById('close-button');
  const modal = document.getElementById('modal');

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

  function onPlayerReady(event) {
    startButton.addEventListener('click', () => {
      event.target.playVideo();
    });
  }

  function FinishButtonActive() {
    FinishButton.disabled = false;
    FinishButton.classList.remove('bg-white');
    FinishButton.classList.add('font-bold', 'text-white', 'bg-yellow-500');
  }

  let start = false;
  let finish = false;
  function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING && !start) {
      setTimeout(FinishButtonActive, 3000);
      done = true;
    }
    if (event.data === YT.PlayerState.ENDED && !finish) {
      videoFinish();
    }
  }


  FinishButton.addEventListener('click', () => {
    videoFinish();
  })

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
        alert('エラーが発生しました');
      })
  }

  closeButton.addEventListener('click', () => {
    modal.classList.remove('scale-100');
  })

})
