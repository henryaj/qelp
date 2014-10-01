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

  context 'creating reviews' do
    before do
      @restaurant = Restaurant.create(name: "Store Street Espresso", description: "San Francisco-style coffee in London.", rating: 5)
    end

    it 'there should be a link to a write review page on each restaurant page' do
      visit "/restaurants/#{@restaurant.id}"
      expect(page).to have_link('Leave review')
    end

    it 'the write review page should have a form on it' do
      visit "/restaurants/#{@restaurant.id}"
      click_link('Leave review')
      expect(page).to have_css('form')
    end

    it 'when submitted, I should be on the restaurant page and see the review there' do
      visit "/restaurants/#{@restaurant.id}"
      click_link('Leave review')
      fill_in("Content", with: "Lovely coffee here")
      fill_in("Rating", with: "5")
      click_button("Submit")
      expect(current_path).to eq("/restaurants/#{@restaurant.id}")
      expect(page).to have_content("Lovely coffee here")
      expect(page).to have_content("5")
    end

    it 'users should not be able to submit reviews with ratings over 5' do
      visit "/restaurants/#{@restaurant.id}"
      click_link('Leave review')
      fill_in("Content", with: "Lovely food here")
      fill_in("Rating", with: "18")
      click_button("Submit")
      expect(page).to have_content("Your rating must be between 1 to 5.")
    end

  end
end
