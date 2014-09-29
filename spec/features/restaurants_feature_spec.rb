require 'rails_helper'

describe 'restaurant' do
  context 'without any restaurants' do
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_link('Add a restaurant')
      expect(page).to have_content('No restaurants')
    end
  end

  context 'there are restaurants' do
    before do
      Restaurant.create(name: "Store Street Espresso", description: "San Francisco-style coffee in London.", rating: 5)
    end

    it 'should show one restaurant' do
      visit '/restaurants'
      expect(page).to have_content('Store Street Espresso')
      expect(page).not_to have_content('No restaurants yet')
    end

  end

  context 'creating restaurants' do
    
    it 'there should be a form to submit a new restaurant' do
      visit '/restaurants/new'
      expect(page).to have_css('form')
    end

    it 'when the form is filled in and submitted, a new restaurant should appear on the restaurants page' do
      visit '/restaurants/new'
      fill_in("restaurant[name]", :with => "Pizza place")
      fill_in("restaurant[description]", :with => "Great pizza here!")
      fill_in("restaurant[rating]", :with => "4")
      click_button("Submit")
      expect(page).to have_content('Pizza place')
      expect(page).not_to have_content('No restaurants yet')
    end

  end

end