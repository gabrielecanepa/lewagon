import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["name", "input", "save", "edit"];

  connect() {
    console.log("Hello from ListItemController!");
  }

  deleteItem() {
    if (confirm("Are you sure you want to delete this item?")) {
      this.element.remove();
    }
  }

  editItem() {
    this.inputTarget.value = this.nameTarget.innerText;
    this.nameTarget.classList.add("d-none");
    this.inputTarget.classList.remove("d-none");
    this.editTarget.classList.add("d-none");
    this.saveTarget.classList.remove("d-none");
  }

  saveItem() {
    this.nameTarget.innerText = this.inputTarget.value;
    this.inputTarget.classList.add("d-none");
    this.nameTarget.classList.remove("d-none");
    this.saveTarget.classList.add("d-none");
    this.editTarget.classList.remove("d-none");
  }
}
