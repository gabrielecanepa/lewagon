# Grocery Bud

Let’s build a grocery list app to practice Stimulus!

## Preparation

ONLY if you are not on CodeSandbox - open a terminal, switch to this project and run:

```sh
code .
serve
```

Then open localhost:8000 in your browser.

## Introduction

We want to implement the following features:

- Add a new item to the list
- Delete an item from the list
- Edit an item from the list

### Adding an item

The first part of the livecode is similar to the one we did in class during the lecture.
Let's breakdown the problem:

```js
// 1. Create a new `list` Stimulus controller and register it in `lib.js`
// 2. Listen to the form submission
// 3. Read the input value
// 4. Insert a new list item in the DOM with the input value
```

#### Creating the controller

Create a `controllers` folder and a controller file using the **naming convention `<controller-name>_controller.js`**:

```sh
mkdir lib/controllers
touch lib/controllers/list_controller.js
```

#### Registering the controller

In your main JavaScript file, import the controller and register it **respecting the naming conventions**:

```js
import ListController from "./controllers/list_controller.js";
// ...
Stimulus.register("list", ListController);
```

#### HTML Targets and actions

Add the stimulus controller on the div wrapping the form and the empty list. All the element inside this div will be accessible from the controller.

```html
<div data-controller="list" class="col-4 offset-4 my-5 bg-white py-4 rounded shadow">
  <!-- ... -->
</div>  
```

We can the set the action to listen to the form submission and two targets `input` (used to read the input value) and `list` (used to insert the new list item in the DOM).

```html
<div data-controller="list" class="col-4 offset-4 my-5 bg-white py-4 rounded shadow">
  <!-- ... -->
  <form data-action="submit->list#addItem" class="row align-items-center mb-3">
    <!-- ... -->
    <input data-list-target="input" type="text" class="form-control" placeholder="Eggs">
    <!-- ... -->
  </form>
  <!-- ... -->
  <ul data-list-target="list" class="list-group list-group-flush"></ul>
</div>
```

#### Stimulus controller

On form submission the controller will:

1. Prevent the default behavior
2. Read the input value
3. Insert a new list item in the DOM with the input value
4. Clear the input value

```js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "list"];

  addItem(event) {
    // 1. Prevent the default behavior
    event.preventDefault();

    // 2. Read the input value
    const itemName = this.inputTarget.value;

    // 3. Insert a new list item in the DOM with the input value
    this.listTarget.insertAdjacentHTML("beforeend", `
      <li class="list-group-item">
        <div>${itemName}</div>
      </li>
    `);

    // 4. Clear the input value
    this.inputTarget.value = "";
  }
}
```

#### Deleting an item

We will now add a button to delete an item from the list.

The problem is that we only have one element connected to our `ListController` on the page 🤔 We can’t build the delete functionality inside of there because we might have many delete buttons on the page. In fact, we’re going to have as many delete buttons as there are items in our list.

So, let’s add a new controller, the `ListItemController` that gets mounted on each individual item in the list.

We want to:

1. Create a new `list-item` Stimulus controller and register it in the `lib` folder.
2. Listen to the click on the delete button
3. Remove the list item from the DOM

#### Creating the controller

```sh
touch lib/controllers/list_item_controller.js
```

#### Registering the controller

```js
import ListItemController from "./controllers/list_item_controller.js";
// ...
Stimulus.register("list-item", listItemController);
```

#### Stimulus controller and action

There’s going to be a bit of inception here. The HTML for each list item is not actually present in our `index.html` file, right? It’s created dynamically in the `list_controller.js` file. So, we have to first edit the HTML string in this other controller JS file.

Let’s add the stimulus controller on the li element injected from `list_controller.js`, put a target on the name, and add a delete button listening to the click event:

```js
// ...
this.listTarget.insertAdjacentHTML("beforeend", `
  <li class="list-group-item" data-controller="list-item">
    <div>${itemName}</div>
    <button type="button" class="btn btn-sm btn-danger" data-action="click->list-item#deleteItem">X</button>
  </li>
`);
```

We can then implement the callback in the newly created list-item controller and use the [remove](https://developer.mozilla.org/en-US/docs/Web/API/Element/remove) method to delete the list item from the DOM.

NOTE: We don’t need a target on the element itself here as `this.element` references the DOM element on which the controller is attached.

```js
import { Controller } from "stimulus"

export default class extends Controller {
  deleteItem(event) {
    this.element.remove();
  }
}
```
