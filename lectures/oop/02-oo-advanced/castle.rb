# class Castle
#   attr_reader :name, :width, :length

#   def initialize(name, width, length)
#     @name = name
#     @width = width
#     @length = length
#   end

#   def floor_area
#     @width * @length
#   end
# end

# The above data can be inherited by the Building class!

require_relative "building"
require_relative "butler"

class Castle < Building
  attr_accessor :moat
  attr_reader :butler

  def initialize(name, width, length, ruler_name)
    # Call the `initialize` method of the parent class `Building`
    super(name, width, length)
    @ruler_name = ruler_name
    # Create a new instance of `Butler` and pass `self` (the castle) as an argument
    @butler = Butler.new(self)
  end

  def has_a_moat?
    @moat == true
  end

  # A castle always has a garden of 300 sq. m
  def floor_area
    super + 300 # `super` calls `floor_area` of `Building`
  end

  # Class method called on the class -> `Castle.categories`
  def self.categories
    ["Medieval", "Norman", "Ancient"]
  end

  def ownership_details
    "#{@name} is ruled by #{ruler_name}"
  end

  def ruler_name
    @ruler_name.capitalize
  end
end
