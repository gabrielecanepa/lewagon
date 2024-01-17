class GardensController < ApplicationController
  before_action :set_garden, only: %i[show]
  
  def index
    @gardens = Garden.all
  end

  def show
    @plant = Plant.new
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
