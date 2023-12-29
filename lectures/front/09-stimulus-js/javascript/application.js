// const button = document.querySelector("#click-me")
// button.addEventListener("click", (event) => {
//   console.log(event);
//   event.currentTarget.classList.remove("btn-primary");
//   event.currentTarget.classList.add("btn-danger");
//   event.currentTarget.innerText = "Bingo!";
// });

import { Application } from 'stimulus';
import DisableButtonController from './controllers/disable_button_controller.js';
import MoviesController from './controllers/movies_controller.js';

window.Stimulus = Application.start();
Stimulus.register('disable-button', DisableButtonController);
Stimulus.register('movies', MoviesController)

