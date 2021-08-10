document.addEventListener('DOMContentLoaded', () => {
  const acorn = document.getElementById('acorn');
  const closeButton = document.getElementById('close-button');
  const modal = document.getElementById('modal');
  const description = document.getElementById('description');
  const descriptionButton = document.getElementById('description-button');
  const descriptionCloseButton = document.getElementById('description-close');

  // どんぐりをタップすると、モーダル表示
  acorn.addEventListener('click', () => {
    modal.classList.add('scale-100');
  });

  // アプリの説明ボタンを押すと、モーダル表示
  descriptionButton.addEventListener('click', () => {
    description.classList.add('scale-100');
  });

  // どんぐりのモーダルの×を押すと閉じる
  closeButton.addEventListener('click', () => {
    modal.classList.remove('scale-100');
  });

  // アプリの説明のモーダルの×を押すと閉じる
  descriptionCloseButton.addEventListener('click', () => {
    description.classList.remove('scale-100');
  });
})
