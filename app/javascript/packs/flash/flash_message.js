document.addEventListener('DOMContentLoaded', () => {
  const flashMessage = document.getElementById('flash-message');
  const FlashClose = document.getElementById('flash-close');

  FlashClose.addEventListener('click', () => {
    flashMessage.remove();
  });

})
