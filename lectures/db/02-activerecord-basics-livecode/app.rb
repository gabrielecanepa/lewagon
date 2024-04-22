require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

get "/new" do
  erb :new
end

post "/restaurants" do
  @restaurant = Restaurant.create(name: params[:name], city: params[:city])
  redirect "/"
end
