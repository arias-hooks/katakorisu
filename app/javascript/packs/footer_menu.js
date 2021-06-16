document.addEventListener('DOMContentLoaded', () => {
  const home = document.getElementById('home');
  const workout = document.getElementById('workout');
  const activity = document.getElementById('activity');

  function homeSelect() {
    home.classList.remove('inactive')
    workout.classList.add('inactive')
    activity.classList.add('inactive')
  }

  function workoutSelect() {
    home.classList.add('inactive')
    workout.classList.remove('inactive')
    activity.classList.add('inactive')
  }

  function activitySelect() {
    home.classList.add('inactive')
    workout.classList.add('inactive')
    activity.classList.remove('inactive')
  }

  if (location.pathname.includes('/squirrel')) {
    homeSelect();
  }

  if (location.pathname.includes('/activity')) {
    activitySelect();
  }
})
