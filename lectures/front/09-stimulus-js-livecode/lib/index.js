import { Application } from "stimulus";
import ListController from "./controllers/list_controller.js";
import ListItemController from "./controllers/list_item_controller.js";

window.Stimulus = Application.start();
window.Stimulus.register("list", ListController);
window.Stimulus.register("list-item", ListItemController);
