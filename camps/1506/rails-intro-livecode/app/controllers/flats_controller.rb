require "open-uri"

class FlatsController < ApplicationController
  def index
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    response = URI.open(url).read
    @flats = JSON.parse(response)

    if params[:search_query]
      @flats = @flats.select { |f| f["name"].downcase.include?(params[:search_query].downcase) }
    end
  end
end
