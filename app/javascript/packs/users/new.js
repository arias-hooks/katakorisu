document.addEventListener('DOMContentLoaded', () => {
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  liff.init({
    liffId: '1656095641-kZGPw9WW'
  })
    .then(() => {
      if (!liff.isLoggedIn()) {
        liff.login()
      }
    })
    .then(() => {
      const idToken = liff.getIDToken()
      debugger
      const body = `idToken=${idToken}`
      const request = new Request('/users', {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
          'X-CSRF-Token': token
        },
        method: 'POST',
        body: body
      });
      debugger
      fetch(request)
        // .then(() => {
        //   const redirect_url = '/squirrel'
        //   window.location = redirect_url
        // })
    })
})
