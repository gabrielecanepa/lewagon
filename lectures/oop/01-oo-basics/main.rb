require "pry-byebug"
# Use `binding.pry` to insert breakpoints and stop the program execution.

require_relative "car"

# Create a new instance of the Car class
ferrari = Car.new("Ferrari", "red")

# Start the engine
ferrari.engine_started? # => false
ferrari.start_engine
# => Fuel pump started
# => Spark plug initialized
ferrari.engine_started? # => true

# See brand and color
ferrari.brand # => "Ferrari"
ferrari.color # => "red"

# Change the color
ferrari.color = "yellow"
ferrari.color # => "yellow"

puts "The car is a #{ferrari.brand} and it is #{ferrari.color}."
