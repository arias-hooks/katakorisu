document.addEventListener('DOMContentLoaded', () => {
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  liff.init({
    liffId: gon.liff_id
  })
    // .then(() => {
    //   if (!liff.isLoggedIn()) {
    //     // 開発時、外部ブラウザからアクセスために利用
    //     liff.login()
    //   }
    // })
    .then(() => {
      const idToken = liff.getIDToken()
      const body = `idToken=${idToken}`
      const request = new Request('/users', {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
          'X-CSRF-Token': token
        },
        method: 'POST',
        body: body
      });
      // lineのユーザーIDトークンをcontrollerに送る
      fetch(request)
        .then(() => {
          // controllerからレスポンスがきたら、ホーム画面にページ遷移
          window.location = '/squirrel'
        })
    })
})
