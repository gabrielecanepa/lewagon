### Object-Oriented Programming (OOP) ###

## Introduction ##

# To deal with more complexslac programs, we need to organize and group objects (data) and their methods (functions).

# Classes define properties and behaviors of specific objects (e.g. a car, a person, a dog, etc.).
# For example, a class Car could have properties like color, make, model, and behaviors like drive, stop, honk, etc.

# Objects are instances of a class.
# An instance of the class Car could be a red Toyota Corolla.

# Let's create a simple Car class and an instance in Ruby.

# Define a class
class Car
end

# Create an instance of the class
car = Car.new

puts car
# => #<Car:0x00007f8e3b8b0e40>

## Initialize Method ##

# When initializing a new instance (using `.new`), the `initialize` method is called.
# We can use the `initialize` method to set the initial state of the object.
# Variables that start with `@` are available throughout the class.

class Car
  def initialize(color, model)
    @color = color
    @model = model
    @engine_started = false
  end
end

# When creating a new instance, we need to pass the required arguments (color and model here).
car = Car.new("red", "Toyota Corolla")

## Instance Methods ##

# We can define methods that are callable on instances of the class.

class Car
  def initialize(color, model)
    @color = color
    @model = model
    @engine_started = false
  end

  # Instance methods

  def engine_started?
    # Return the value of the instance variable
    @engine_started
  end

  def start_engine
    # Change the value of the instance variable
    @engine_started = true
  end
end

car = Car.new("red", "Toyota Corolla")
car.engine_started? # => false
car.start_engine
car.engine_started? # => true

## Setting and accessing state ##

# By default, instance variables cannot be accessed from outside the class.

car = Car.new("red", "Toyota Corolla")
car.color # => NoMethodError (undefined method `color' for #<Car:0x00007f8e3b8b0e40>)

# We can define methods to access the state of the object.

class Car
  # ...

  def color
    @color
  end
end

car.color # => "red"

# There is a convenient shortcut to make the instance variable accessible from outside the class.

class Car
  # ...

  attr_reader :color
  # Use this instead of defining the previous method manually!
end

# We can also define methods to change the state of the object.

class Car
  # ...

  def color=(new_color)
    @color = new_color
  end
end

car.color = "blue"
car.color # => "blue"

# There is another convenient shortcut to make the instance variable writable from outside the class.

class Car
  # ...

  attr_writer :color
  # Use this instead of defining the previous method manually!
end

# We can combine the two shortcuts to make the instance variable both readable and writable.

class Car
  # ...

  attr_accessor :color
  # Use this instead of attr_reader + attr_writer!
end

# Multiple instance variables can be set with a single `attr_xxx` call.

class Car
  # ...

  attr_accessor :color, :model
end

## Private Methods ##

# We can define private methods that are only callable within the class and not the outside.
# This is useful for methods that are only used inside the class.

class Car
  def start_engine
    start_fuel_pump
    @engine_started = true
  end

  private

  def start_fuel_pump
    puts "Fuel pump started"
  end
end

car = Car.new
car.start_fuel_pump # => NoMethodError (private method `start_fuel_pump' called for #<Car:0x00007f8e3b8b0e40>)
car.start_engine # => "Fuel pump started"
