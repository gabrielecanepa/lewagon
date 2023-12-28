import Mustache from 'mustachejs';

const results = document.getElementById('results');
const template = document.getElementById('movieCardTemplate');

fetch("http://www.omdbapi.com/?s=harry potter&apikey=adf1f2d7")
  .then(response => response.json())
  .then((data) => {
    data.Search.forEach((movie) => {
      // 1. Inject the HTML directly
      // const movieCard = `<div class='col-3'>
      //   <div class="card" style="width: 18rem;">
      //     <img src="${movie.Poster}" class="card-img-top" alt="${movie.Title} poster">
      //     <div class="card-body">
      //       <h6 class="card-title">${movie.Title}</h6>
      //       <p class="card-text">${movie.Year}</p>
      //       <a href="https://www.imdb.com/title/${movie.imdbID}" class="btn btn-primary" target="_blank">Go on IMDB</a>
      //     </div>
      //   </div>
      // </div>`;
      // results.insertAdjacentHTML("beforeend", movieCard);

      // 2. Let's use the template tag instead
      // const clone = template.content.cloneNode(true);
      // clone.querySelector("img").src = movie.Poster
      // clone.querySelector("h6").textContent = movie.Title
      // clone.querySelector("p").textContent = movie.Year
      // clone.querySelector("a").href = `https://www.imdb.com/title/${movie.imdbID}`
      // results.appendChild(clone);

      // 3. Let's use Mustache! See https://github.com/janl/mustache.js
      // const templateContent = template.innerHTML; // MustacheJS only accepts strings (and not HTML fragments)
      // const output = Mustache.render(templateContent, movie);
      // results.insertAdjacentHTML("beforeend", output);
    });

    // 4. Let's use Mustache's sections and avoid looping! See https://github.com/janl/mustache.js/#sections
    const templateContent = template.innerHTML;
    const movieData = { movies: data.Search };
    const output = Mustache.render(templateContent, movieData);
    results.innerHTML = output;
  });
