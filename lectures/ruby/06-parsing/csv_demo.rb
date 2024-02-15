require "csv"

filepath = "data/beatles.csv"

# Read each row
CSV.foreach(filepath) do |row|
  # Here, row is an array of columns
  puts "#{row[0]} | #{row[1]} | #{row[2]}"
end

# Read each row using headers
CSV.foreach(filepath, headers: :first_row) do |row|
  puts "#{row['First Name']} #{row['Last Name']} played #{row['Instrument'].downcase}"
end

# Write a CSV
CSV.open(filepath, "wb") do |csv|
  csv << ["First Name", "Last Name", "Instrument"]
  csv << ["John", "Lennon", "Guitar"]
  csv << ["Paul", "McCartney", "Bass Guitar"]
  # ...
end
