document.addEventListener('DOMContentLoaded', () => {
  const name = document.querySelector("#name");
  const picture = document.querySelector("#picture");

  liff.init({
    liffId: '1656095641-kZGPw9WW'
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
})
