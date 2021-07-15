document.addEventListener('DOMContentLoaded', () => {
  const acorn = document.getElementById('acorn');
  const closeButton = document.getElementById('close-button');
  const modal = document.getElementById('modal');
  const description = document.getElementById('description');
  const descriptionButton = document.getElementById('description-button');
  const descriptionCloseButton = document.getElementById('description-close');

  acorn.addEventListener('click', () => {
    modal.classList.add('scale-100');
  });

  descriptionButton.addEventListener('click', () => {
    description.classList.add('scale-100');
  });

  closeButton.addEventListener('click', () => {
    modal.classList.remove('scale-100');
  });

  descriptionCloseButton.addEventListener('click', () => {
    description.classList.remove('scale-100');
  });
})
