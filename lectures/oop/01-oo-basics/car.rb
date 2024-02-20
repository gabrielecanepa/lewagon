class Car
  attr_accessor :color
  attr_reader :brand

  def initialize(brand, color)
    puts "New car created"
    @engine_started = false
    @brand = brand
    @color = color
  end

  def engine_started?
    @engine_started
  end

  def start_engine
    start_fuel_pump
    init_spark_plug
    @engine_started = true
  end

  # Use `attr_reader` instead
  # def color
  #   @color
  # end

  # Use `attr_writer` instead
  # def color=(color)
  #   @color = color
  # end

  # Use `attr_accessor` to define both `attr_reader` and `attr_writer`

  private

  # The following methods are private (not exposed) and cannot be called on a car instance

  def start_fuel_pump
    puts "Fuel pump started"
  end

  def init_spark_plug
    puts "Spark plug initialized"
  end
end
