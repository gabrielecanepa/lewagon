const GARAGE = "your-garage-name";
const garageUrl = `https://wagon-garage-api.herokuapp.com/${GARAGE}/cars`

// Select car form and list
const carForm = document.querySelector(".car-form");
const carsList = document.querySelector(".cars-list");

const createCar = (event) => {
  event.preventDefault();
  const brand = document.querySelector('input[name="brand"]')
  const model = document.querySelector('input[name="model"]')
  const plate = document.querySelector('input[name="plate"]')
  const owner = document.querySelector('input[name="owner"]')

  const newCar = { brand, model, plate, owner }

  fetch(garageUrl, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(newCar)
  }).then(() => refreshCars());
  
  event.currentTarget.reset();
}

carForm.addEventListener("submit", createCar);

const refreshCars = () => {
  fetch(garageUrl)
    .then(response => response.json())
    .then((data) => {
      carsList.innerHTML = "";
      data.forEach(car => insertCarCard(car));
    });
}

const fetchAllCars = () => {
  fetch(`https://wagon-garage-api.herokuapp.com/${GARAGE}/cars`)
    .then(response => response.json())
    .then((data) => {
      carsList.innerHTML = "";
      data.forEach(car => insertCarCard(car));
    });
}

const insertCarCard = (car) => {
  const carCard = `<div class="car">
    <div class="car-image">
      <img src="https://loremflickr.com/300/300/${car.brand}">
    </div>
    <div class="car-info">
      <h4>${car.brand} - ${car.model}</h4>
      <p><strong>Owner:</strong> ${car.owner}</p>
      <p><strong>Plate:</strong> ${car.plate}</p>
    </div>
  </div>`;

  carsList.insertAdjacentHTML("beforeend", carCard);
}

fetchAllCars();
