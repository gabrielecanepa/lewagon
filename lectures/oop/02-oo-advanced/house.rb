# class House
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

class House < Building
  # Class method called on the class -> `House.price_per_square_meter(city)`
  def self.price_per_square_meter(city)
    case city
    when "Paris" then 9000
    when "Brussels" then 3000
    else raise Exception, "No data for #{city}"
    end
  end
end
