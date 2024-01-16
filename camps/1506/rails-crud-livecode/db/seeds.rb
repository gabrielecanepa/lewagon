# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

pets = [
  {
    name: "Ziggy",
    address: "Genova",
    species: "cat",
    found_on: Time.now - 2.days,
  },
  {
    name: "Rust",
    address: "Milan",
    species: "dog",
    found_on: Time.now - 1.days,
  },
  {
    name: "Frank",
    address: "Casablanca",
    species: "turtle",
    found_on: Time.now - 5.days,
  },
]

pets.each do |pet|
  Pet.create!(pet)
  puts "#{pet[:name]} created"
end

puts "Done!"
