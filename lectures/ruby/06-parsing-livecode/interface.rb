require "yaml"
require_relative "scraper"

puts "Scraping movies..."
movies = scrape_movies

puts "Writing movies.yml"
File.write("movies.yml", movies.to_yaml)

puts "Done!"
