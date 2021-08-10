document.addEventListener('DOMContentLoaded', () => {
  const name = document.getElementById('name');
  const picture = document.getElementById('picture');
  const selectForm = document.getElementById('setting_notification');
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  liff.init({
    liffId: gon.liff_id
  })
    .then(() => {
      liff.getProfile()
        .then(user => {
          // Lineのユーザー名が取得できていたら、表示する
          if (typeof user.displayName !== 'undefined') {
            name.innerText = user.displayName;
          }
          // Lineのプロフィール画像が取得できていたら、表示する
          if (typeof user.pictureUrl !== 'undefined') {
            picture.src = user.pictureUrl;
          }
        })
    })

  // 通知設定フォームが変更されたら、ajax処理で更新
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
        if (data['status'] === 200) {
          swal(`${data.notification}に変更しました。`);
        } else {
          throw new Error('statusError');
        }
      })
      .catch(() => {
        swal('通知設定の更新に失敗しました');
      })
  });
})
