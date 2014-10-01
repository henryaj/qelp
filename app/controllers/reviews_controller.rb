class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new    
  end  

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(params[:review].permit(:content, :rating))
    if @review.save
      redirect_to "/restaurants/#{@restaurant.id}"
    else
      render 'new'
    end
  end

end
