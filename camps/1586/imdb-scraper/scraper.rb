require "open-uri"
require "nokogiri"
require "yaml"

# Declare constants (variables that don't change) at the top of the file and in uppercase
IMDB_URL = "https://www.imdb.com/chart/top/"
# We need a different user agent to fake the device we are using, otherwise the website will recognize we are using a bot and block us
USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"

puts "Scraping movies..."

response = URI.parse(IMDB_URL).open("User-Agent" => USER_AGENT).read
# `response` is a string containing the HTML of the page

puts "Parsing movies..."

document = Nokogiri::HTML.parse(response)
# `document` is a nokogiri object containing the HTML of the page in a structured way

movies = document.search(".ipc-metadata-list-summary-item").first(5)
# `movies` is an array of nokogiri objects, each containing the structured HTML of a movie

movies_collection = []

# For each movie, we extract the title, year and duration
# We then store this information in a hash and add it to the `movies_collection` array
movies.each do |movie|
  title = movie.search(".ipc-title__text").text.gsub(/\d\.\s/, "")

  metadata = movie.search(".cli-title-metadata-item")
  year = metadata[0].text.to_i
  duration = metadata[1].text

  movie_hash = {
    title: title,
    year: year,
    duration: duration,
  }

  movies_collection << movie_hash
end

puts "Writing movies into a YAML file..."

# We write the `movies_collection` array into a YAML file 
# using the `to_yaml` method (provided by the YAML module imported at the top)
File.write("movies.yml", movies_collection.to_yaml)

puts "Done!"
