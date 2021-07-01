document.addEventListener('DOMContentLoaded', () => {
  const acorn = document.getElementById('acorn');
  const closeButton = document.getElementById('close-button');
  const modal = document.getElementById('modal');

  acorn.addEventListener('click', () => {
    modal.classList.add('scale-100');
  });

  closeButton.addEventListener('click', () => {
    modal.classList.remove('scale-100');
  });
})
