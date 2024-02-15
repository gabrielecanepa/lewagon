require "open-uri"
require "nokogiri"

IMDB_TOP_URL = "https://www.imdb.com/chart/top/"
USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"

def scrape_movies
  response = URI.parse(IMDB_TOP_URL).open("Accept-Language" => "en-US", "User-Agent" => USER_AGENT).read
  document = Nokogiri::HTML.parse(response)

  movies = document.search(".ipc-metadata-list-summary-item:nth-child(-n + 5)")

  movies.map do |movie|
    metadata = movie.search(".cli-title-metadata-item").map(&:text)

    {
      title: movie.search("h3").text.gsub(/\d\.\s/, ""),
      year: metadata.first.to_i,
      duration: metadata[1],
      rating: movie.search(".ipc-rating-star").first.text.split(" ").first.to_f,
    }
  end
end
