// TODO - Fetch an activity with the Bored API - Let's psuedocode!
const url = 'https://www.boredapi.com/api/activity/';

const button = document.querySelector('.btn-warning');
const activity = document.querySelector('#activity');

button.addEventListener('click', () => {
  // Callback
  fetch(url)
    .then(response => response.json())
    .then(data => {
      activity.innerText = data.activity;
    });
});
