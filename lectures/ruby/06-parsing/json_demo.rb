require "json"

filepath = "data/beatles.json"

# Read the file content (as a string) and parse it as a Ruby hash
file_content = File.read(filepath)
beatles = JSON.parse(file_content)["beatles"]

beatles.each do |beatle|
  puts "#{beatle['first_name']} #{beatle['last_name']} played #{beatle['instrument'].downcase}"
end

# Write an array of hashes to a JSON file
beatles = {
  beatles: [
    {
      first_name: "John",
      last_name: "Lennon",
      instrument: "Guitar",
    },
    {
      first_name: "Paul",
      last_name: "McCartney",
      instrument: "Bass Guitar",
    },
    # etc...
  ],
}

File.binwrite(filepath, JSON.generate(beatles))
