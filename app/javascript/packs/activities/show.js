document.addEventListener('DOMContentLoaded', () => {
  const name = document.getElementById('name');
  const picture = document.getElementById('picture');
  const selectForm = document.getElementById('setting_notification');
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  liff.init({
    liffId: gon.liff_id
  })
    .then(() => {
      if (!liff.isLoggedIn()) {
        liff.login()
      }
    })
    .then(() => {
      liff.getProfile()
        .then(user => {
          if (typeof user.displayName !== 'undefined') {
            name.innerText = user.displayName;
          }
          if (typeof user.pictureUrl !== 'undefined') {
            picture.src = user.pictureUrl;
          }
        })
    })

  selectForm.addEventListener('change', () => {
    const body = `selected=${selectForm.value}`;
    const request = new Request('/setting', {
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
        console.log(data);
        alert(`${data.notification}に変更しました。`);
      })
      .catch(() => {
        alert('通知設定の更新に失敗しました');
      })
  });
})
