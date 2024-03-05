require_relative "building"

class House < Building
  def self.price_per_square_meter(city)
    case city
    when "Casablanca"
      9000
    when "Genova"
      3000
    else
      puts "No data for this city"
    end
  end
end
