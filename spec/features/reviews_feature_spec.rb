require 'rails_helper'

describe 'restaurant reviews' do

  context 'displaying reviews' do

    before do
      @restaurant = Restaurant.create(name: "Store Street Espresso", description: "San Francisco-style coffee in London.", rating: 5)
    end

    it 'should be able to have a review' do
      @restaurant.reviews.create(content: "Pretty good coffee", rating: 4)
      expect(@restaurant.reviews.first.content).to eq "Pretty good coffee"
      expect(@restaurant.reviews.first.rating).to eq 4
    end

    it 'should have all its reviews printed on its page' do
      @restaurant.reviews.create(content: "Pretty good coffee", rating: 4)
      @restaurant.reviews.create(content: "So tasty. I'll definitely come back for the espresso", rating: 5)
      @restaurant.reviews.create(content: "Delicious coffee here", rating: 4)
      visit "/restaurants/#{@restaurant.id}"
      expect(page).to have_content("Pretty good coffee")
      expect(page).to have_content("So tasty. I'll definitely come back for the espresso")
      expect(page).to have_content("Delicious coffee here") 
    end

  end

end
