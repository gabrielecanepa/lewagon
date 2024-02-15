require "open-uri"
require "nokogiri"

# Let's scrape recipes from https://bbcgoodfood.com
ingredient = "chocolate"
url = "https://www.bbcgoodfoodme.com/search-results/?q=#{ingredient}"

# Open the URL and read the HTML content as string
html_file = URI.open(url).read
# Parse the HTML content as a Nokogiri object
html_doc = Nokogiri::HTML.parse(html_file)

# Iterate over the search results and print the title and URL of each recipe
html_doc.search(".list-row article .entry-title a").each do |element|
  # `element` is a Nokogiri element
  puts element.text.strip
  puts element.attribute("href").value
end

# See https://kitt.lewagon.com/knowledge/cheatsheets/nokogiri for more about Nokogiri
