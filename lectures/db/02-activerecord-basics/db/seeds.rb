# Manual restaurant creation
puts "Creating 2 restaurants..."

tour_d_argent = Restaurant.new(name: "La Tour d'Argent")
tour_d_argent.save!
chez_gladines = Restaurant.new(name: "Chez Gladines")
chez_gladines.save!

# Using the faker gem
puts "Creating 100 restaurants with Faker..."

100.times do
  restaurant = Restaurant.new(
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    rating: rand(0..5)
  )
  restaurant.save!
end

puts "Finished!"
