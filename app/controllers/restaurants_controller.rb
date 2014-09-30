class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
        redirect_to restaurants_path
    else
        render 'new'
    end
    @restaurants = Restaurant.all
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "Restaurant deleted successfully"
    redirect_to restaurants_path
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :rating)
    end

end
