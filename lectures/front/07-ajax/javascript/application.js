// Import external libraries at the top of the file
import Swal from 'sweetalert2';

// Let's use the github api!
const url = 'https://api.github.com/users/dhh';

// Promise
console.log(fetch(url));

// Fulfill the Promise using `then` => Response
fetch(url)
  .then((response) => response.json())
  .then((data) => {
    console.log(data);
  });

// Let's interact with the Reqres API
const form = document.getElementById('form');
const emailInput = document.getElementById('email');
const passwordInput = document.getElementById('password');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const emailValue = emailInput.value;
  const passwordValue = passwordInput.value;

  const requestOptions = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ email: emailValue, password: passwordValue })
  }

  fetch('https://reqres.in/api/register', requestOptions)
    .then((response) => {
      if (response.status === 200) {
        Swal.fire({ title: 'Success!', text: 'You are logged in.', icon: 'success' })
      } else {
        Swal.fire({ title: 'Error', text: 'Wrong email or password.', icon: 'error' })
      }
    });
})

