// TODO write your code here
const POKEMON_URL = 'https://pokeapi.co/api/v2/pokemon?limit=1000&offset=0';

const cardTemplate = document.getElementById('cardTemplate');
const infoTemplate = document.getElementById('infoTemplate');

fetch(POKEMON_URL)
  .then((response) => response.json())
  .then((data) => {
    const pokemons = data.results;

    pokemons.forEach((pokemon) => {
      fetch(pokemon.url)
        .then((response) => response.json())
        .then((pokemonData) => {
          const clone = cardTemplate.content.cloneNode(true);
          clone.querySelector(".pokemon-card-image").src = pokemonData.sprites.front_default;
          clone.querySelector(".pokemon-card-title").textContent = pokemon.name;
          clone.querySelector(".pokemon-card-subtitle").textContent = pokemonData.types
            .map((type) => type.type.name)
            .join(", ");

          clone.querySelector(".pokemon-card-link").addEventListener("click", (event) => {
            event.preventDefault();
            infoContainer.innerHTML = "";
  
            const infoClone = infoTemplate.content.cloneNode(true);
            infoClone.querySelector(".pokemon-card-image").src = pokemonData.sprites.front_default;
            infoClone.querySelector(".pokemon-card-title").textContent = pokemon.name;
            infoClone.querySelector(".pokemon-card-subtitle").textContent = pokemonData.types
              .map((type) => type.type.name)
              .join(", ");
            infoContainer.innerHTML = "";
            infoContainer.appendChild(infoClone);
          });
  
          cardsContainer.appendChild(clone);
        });
      
    });
  });
