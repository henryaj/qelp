class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new    
  end  

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(params[:review].permit(:content, :rating))
    redirect_to "/restaurants/#{@restaurant.id}"
  end

end
