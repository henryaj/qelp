require 'spec_helper'

RSpec.describe Review, :type => :model do
  it 'has a rating that is not more than 5' do
    restaurant = Restaurant.create(name: "The Ivy")
    review = restaurant.reviews.create(content: "Nice place", rating: "9")
    expect(review).to have(1).error_on(:rating)
  end
end