class PlantsController < ApplicationController
  def create
    # 1. Initialize a new plant with the params coming from the form
    @plant = Plant.new(plant_params)
    # 2. Find the garden using the garden_id param coming from the url
    @garden = Garden.find(params[:garden_id])
    # 3. Associate the plant to the garden
    @plant.garden = @garden
    # 4. Save the plant
    @plant.save

    # Redirect to the garden show page
    redirect_to garden_path(@garden)
  end

  def destroy
    # 1. Find the plant using the :id param coming from the url
    @plant = Plant.find(params[:id])
    # 2. Destroy the plant
    @plant.destroy

    # Redirect to the garden show page
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
