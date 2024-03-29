# TODO: Define your Controller Class here, to orchestrate the other classes

###

require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  # USER ACTIONS

  def list
    display_recipes
  end

  def add
    # 1. Ask user for a name (view)
    name = @view.ask_user_for("name")
    # 2. Ask user for a description (view)
    description = @view.ask_user_for("description")
    # 3. Create recipe (model)
    recipe = Recipe.new(name, description)
    # 4. Store in cookbook (repo)
    @cookbook.create(recipe)
    # 5. Display
    display_recipes
  end

  def remove
    # 1. Display recipes
    display_recipes
    # 2. Ask user for index (view)
    index = @view.ask_user_for_index
    # 3. Remove from cookbook (repo)
    @cookbook.destroy(index)
    # 4. Display
    display_recipes
  end

  private

  def display_recipes
    # 1. Get recipes (repo)
    recipes = @cookbook.all
    # 2. Display recipes in the terminal (view)
    @view.display_list(recipes)
  end
end
