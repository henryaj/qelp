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
    render :index
  end

  private
      def restaurant_params
      params.require(:restaurant).permit(:name, :description, :rating)
      # name: params[:name], description: params[:description], rating: params[:rating]
    end

end
