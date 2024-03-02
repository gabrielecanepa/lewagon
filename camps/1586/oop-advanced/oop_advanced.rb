### Object-Oriented Programming Advanced ###

# Use this file as a reference, don't run it!

## Introduction ##

class House
  attr_reader :name, :width, :length

  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
  end

  def floor_area
    @width * @length
  end

  def build
    puts "Building a house"
    build_scaffolding
    build_walls
    build_roof
  end

  private

  def build_scaffolding
    puts "Building the scaffolding"
  end

  def build_walls
    puts "Building the walls"
  end

  def build_roof
    puts "Building the roof"
  end
end

class Castle
  attr_reader :name, :width, :length

  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
  end

  def floor_area
    @width * @length
  end

  def build
    puts "Building a house"
    build_scaffolding
    build_walls
    build_roof
  end

  private

  def build_scaffolding
    puts "Building the scaffolding"
  end

  def build_walls
    puts "Building the walls"
  end

  def build_roof
    puts "Building the roof"
  end
end

white_house = House.new("White House", 55, 70)
white_house.name # => "White House"
white_house.floor_area # => 3850

tower_of_london = Castle.new("Tower of London", 100, 120)
tower_of_london.name # => "Tower of London"
tower_of_london.floor_area # => 12000

## Inheritance ##

# The previous classes are very similar, they have the same attributes and methods. DRY - Don't Repeat Yourself!
# Both classes can **inherit** from a superclass called Building, which will contain the common attributes and methods.

class Building
  attr_reader :name, :width, :length

  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
  end

  def floor_area
    @width * @length
  end

  def build
    puts "Building a house"
    build_scaffolding
    build_walls
    build_roof
  end

  private

  def build_scaffolding
    puts "Building the scaffolding"
  end

  def build_walls
    puts "Building the walls"
  end

  def build_roof
    puts "Building the roof"
  end
end

# Inheritance is done using the `<` symbol, followed by the name of the superclass.
# Every method and attribute from the superclass will be available in the subclass.

class House < Building
end

class Castle < Building
end

# The previous code will give the same result as the first example:

white_house = House.new("White House", 55, 70)
white_house.name # => "White House"
white_house.floor_area # => 3850

tower_of_london = Castle.new("Windsor Castle", 100, 120)
tower_of_london.name # => "Windsor Castle"
tower_of_london.floor_area # => 12000

## Class-Specific Methods ##

# A class can have other specific attributes and methods that are not defined on the Building class.

class Castle < Building
  attr_accessor :moat

  def has_a_moat?
    @moat == true
  end
end

# The code inherited from the Building class is also still available.

tower_of_london = Castle.new("Tower of London", 100, 120)
tower_of_london.name # => "Tower of London"
tower_of_london.floor_area # => 12000

tower_of_london.moat = true
tower_of_london.has_a_moat? # => true

# The House class won't have the `moat` attribute and `has_a_moat?` method, because it's specific to the Castle class.

white_house = House.new("White House", 55, 70)
white_house.moat = true # => NoMethodError (undefined method `moat=' for #<House:0x00007f9e1d8b4f40>)
white_house.has_a_moat? # => NoMethodError (undefined method `has_a_moat?' for #<House:0x00007f9e1d8b4f40>)

## Overriding Inherited Methods ##

# A subclass can override a method from the superclass by defining a method with the same name.

class Castle < Building
  def floor_area
    (@width * @length) + 1000
  end
end

# The `floor_area` method from the Castle class will be called instead of the one from the Building class.

tower_of_london = Castle.new("Tower of London", 100, 120)
tower_of_london.floor_area # => 121000 (100 * 120 + 1000)

# When we want to extend the behavior of a method from the superclass, we can use the `super` keyword.
# `super` calls the parent’s method with the **same** name.

class Castle < Building
  def floor_area
    super + 1000
    # super is equivalent to `@width * @length`, defined on Building
  end
end

tower_of_london = Castle.new("Tower of London", 100, 120)
tower_of_london.floor_area # => 121000 (100 * 120 + 1000)

## Inheritance Summary ##

# 1. Inheritance is used when classes need to share behavior and properties
# 2. Subclasses inherit methods and instance variables from parents
# 3. On top of that, subclasses can define more instance variables and methods
# 4. Use `super` to access the parent method with the same name

## Class Methods ##

# Reminder: a class is the representation of an entity and is used to define instances.
# Instances are created using the `new` method.

class Castle < Building # -> this is a class
  attr_accessor :moat

  def has_a_moat?
    @moat == true
  end
end

tower_of_london = Castle.new("Tower of London", 100, 120) # -> this is an instance

# Every method defined in a class (other than private ones) is called on an instance.

tower_of_london.has_a_moat? # -> this is an instance method

# Sometimes, we want to define methods that are called on the class itself, not on an instance.
# Why? Because some methods can be related to the whole class and not to a specific instance.
# These are called **class methods**.

# Class methods are defined using the `self` keyword followed by the method name.

class Castle < Building
  # Categories are related to all castles, not a specific one.
  def self.categories
    ["Medieval", "Norman", "Ancient"]
  end
end

Castle.categories # => ["Medieval", "Norman", "Ancient"]

# Class methods **can't** be called on an instance.

tower_of_london.categories # => NoMethodError (undefined method `categories' for #<Castle:0x00007f9e1d8b4f40>)

# Class methods can be used with parameters.

class House < Building
  # The price per square meter is related to houses in a city, not to a specific house.
  def self.price_per_square_meter(city)
    case city
    when "Paris"
      9000
    when "Brussels"
      3000
    else
      puts "No data for #{city}"
    end
  end
end

puts House.price_per_square_meter("Paris") # => 9000

### Using `self` in a Class ###

# As seen in the previous examples, `self` is used to define class method when prefixed to the method name.

# `self` can also be used inside a "normal" method (instance method) to refer to the current instance (not the class itself).

class Building
  attr_reader :name, :width, :length

  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
  end

  def floor_area
    @width * @length
  end

  def to_s
    # `self` can be omitted when calling an internal attribute or method, since it's already available in the class.
    # It must be used when calling methods that are not defined inside the class.
    "#{@name} (#{self.class})"
  end
end

tower_of_london = Castle.new("Tower of London", 100, 120)
tower_of_london.to_s # => "Tower of London (Castle)"

white_house = House.new("White House", 55, 70)
white_house.to_s # => "White House (House)"
