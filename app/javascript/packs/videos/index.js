document.addEventListener('DOMContentLoaded', () => {
  const videos = document.getElementsByClassName('video');

  for (let i = 0; i < videos.length; i++) {
    let youtube_id = videos[i].dataset.youtube;
    let url = `https://www.googleapis.com/youtube/v3/videos?id=${youtube_id}&key=${gon.youtube_api_key}&part=snippet, contentDetails&fields=items(snippet(title), contentDetails(duration))`
    fetch(url)
      .then(response => response.json())
      .then(data => {
        let rawDuration = data['items'][0]['contentDetails']['duration']
        let h = /^PT([0-9]+)H/.exec(rawDuration) ? `${/^PT([0-9]+)H/.exec(duration)[1]}:` : ''
        let m = /([0-9]+)M/.exec(rawDuration) ? `${/([0-9]+)M/.exec(rawDuration)[1]}:` : '00:'
        let s = /([0-9]+)S$/.exec(rawDuration) ? /([0-9]+)S$/.exec(rawDuration)[1].padStart(2, '0') : '00'
        let title = data['items'][0]['snippet']['title']
        let duration = `${h}${m}${s}`
        videos[i].children[0].innerText = title
        videos[i].children[1].innerText = duration
      })
  }
})
