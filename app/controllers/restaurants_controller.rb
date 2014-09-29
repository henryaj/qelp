class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    
    @restaurants = Restaurant.all
    redirect_to restaurants_path
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :rating)
    end

end
