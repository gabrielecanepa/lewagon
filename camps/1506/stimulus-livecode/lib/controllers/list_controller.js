import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input", "list"];

  addItem(event) {
    // 1. Prevent the default behavior
    event.preventDefault();

    // 2. Read the input value
    const itemName = this.inputTarget.value;

    // 3. Insert a new list item in the DOM with the input value
    this.listTarget.insertAdjacentHTML("beforeend", `
      <li class="list-group-item" data-controller="list-item">
        <span>${itemName}</span>
        <button type="button" class="btn btn-sm btn-danger" data-action="click->list-item#deleteItem">X</button>
      </li>
    `);

    // 4. Clear the input value
    this.inputTarget.value = "";
  }
}
