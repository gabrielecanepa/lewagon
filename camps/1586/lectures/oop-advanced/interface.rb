require_relative "castle"
require_relative "house"

white_house = House.new("The White House", 100, 200)
tower_of_london = Castle.new("Tower of London", 500, 700)

# TODO: play around with the house and castle instances!
# - Use methods inherited from the Building class on House and Castle instances
# - Call class-specific methods, like `has_a_moat?`
# - See the usage of `super`
# - Call class methods like `price_per_square_meter`
# - Understand the usage of `self` in a class (before a method name or inside a method)
