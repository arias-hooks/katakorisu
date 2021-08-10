document.addEventListener('DOMContentLoaded', () => {
  const flashMessage = document.getElementById('flash-message');
  const FlashClose = document.getElementById('flash-close');

  // フラッシュメッセージの×を押すと消えるようにする
  FlashClose.addEventListener('click', () => {
    flashMessage.remove();
  });

})
