import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["input", "list"];

  connect() {
    console.log("Hello from ListController!");
  }

  addItem(event) {
    event.preventDefault();

    const item = this.inputTarget.value;

    this.listTarget.insertAdjacentHTML("beforeend", `
      <li class="d-flex mb-3 align-items-center" data-controller="list-item">
        <div class="me-2" data-list-item-target="name">${item}</div>
        <input type="text" class="me-2 d-none" data-list-item-target="input" />
        <button 
          type="button" 
          class="btn btn-sm btn-primary me-2"
          data-list-item-target="edit"
          data-action="click->list-item#editItem"
        >
          edit
        </button>
        <button 
          type="button" 
          class="btn btn-sm btn-success me-2 d-none"
          data-list-item-target="save"
          data-action="click->list-item#saveItem"
        >
          save
        </button>
        <button 
          type="button" 
          class="btn btn-sm btn-danger" 
          data-action="click->list-item#deleteItem"
        >
          delete
        </button>
      </li>
    `);
    this.inputTarget.value = "";
  }
}
