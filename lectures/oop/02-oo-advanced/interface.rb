require_relative "castle"
require_relative "house"

### Inheritance ###

# The Castle and House classes inherit `name`, `width`, `length`, and `floor_area` from the Building class.
# This is an example of the inheritance in OOP.

some_house = House.new("White House", 26, 51)
some_house.name #=> "White House"
some_house.floor_area #=> 1326

some_castle = Castle.new("Tower of London", 32, 35)
some_castle.name #=> "Tower of London"

### Class-specific attributes and methods ###

# The Castle class has an additional `moat` attribute and a `has_moat?` method.
some_castle.has_a_moat? # => false
some_castle.moat = true
some_castle.has_a_moat? # => true

# The House class doesn't have a `moat` attribute or a `has_moat?` method.
some_house = House.new("White House", 26, 51)
some_house.has_a_moat? #=> Undefined method `has_a_moat?`

### Overriding and extending methods ###

# A castle always has a garden of 300 sq. m that is added to the floor area of the building.
other_castle = Castle.new("Sforzesco Castle", 15, 18)
other_castle.floor_area # => 670 (15 * 18 + 300)

### Class methods using `self` ###

# You create a class method if it does not need/is not relevant to a single instance.

# The Castle class has a class method `categories` that returns an array of strings.
Castle.categories.join(", ") # => Medieval, Norman, Ancient
# You can't call class methods on instances!
other_castle.categories # => Undefined method `categories`

# The House class has a class method `price_per_square_meter` that returns the price per square meter in a given
House.price_per_square_meter("Paris") # => 9000

# Real life examples:
# `now` is a class method of the `Time` class which returns an instance of `Time`.
Time.now # => 2017-07-23 12:39:54 +0200
# `parse` is a class method of the `JSON` class which returns an instance of `Hash`.
JSON.parse('{ "key": "value", "other_key": "other_value" }')

### Using `self` in an instance method ###

# When initializing a new instance of `Castle`, a new instance of `Butler` is created and passed `self` (the castle) as an argument.
aladdin_castle = Castle.new("The magical Sultan palace", 410, 520, "Aladdin")
# The butler has access to the castle's details.
aladdin_castle.butler.clean_castle # => "The magical Sultan palace is cleaned!"
