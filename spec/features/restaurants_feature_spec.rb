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
      expect(current_path).to eq('/restaurants')
    end

    it 'restaurants cannot have a name shorter than three characters' do
      visit '/restaurants/new'
      fill_in("restaurant[name]", :with => "Pi")
      fill_in("restaurant[description]", :with => "Great pizza here!")
      fill_in("restaurant[rating]", :with => "4")
      click_button("Submit")
      expect(page).to have_content('That restaurant name is too short.')
      visit('/restaurants')
      expect(page).not_to have_content('Pi')
    end
  end

  context 'uploading images' do

    it "restaurants can have an image a restaurant's image shows up on the home page" do
      visit '/restaurants/new'
      fill_in("restaurant[name]", :with => "Pizza place")
      fill_in("restaurant[description]", :with => "Great pizza here!")
      fill_in("restaurant[rating]", :with => "4")
      attach_file("restaurant[image]", 'spec/fixtures/files/image.jpg')
      click_button("Submit")
      expect(page).to have_xpath("//img") 
    end

    it "a restaurant's image shows up on the restaurant show page" do
      visit '/restaurants/new'
      fill_in("restaurant[name]", :with => "Pizza place")
      fill_in("restaurant[description]", :with => "Great pizza here!")
      fill_in("restaurant[rating]", :with => "4")
      attach_file("restaurant[image]", 'spec/fixtures/files/image.jpg')
      click_button("Submit")
      click_link("View Pizza place")
      expect(page).to have_xpath("//img")
    end

  end

  context 'viewing restaurants' do
    before do
      visit '/restaurants/new'
      fill_in("restaurant[name]", :with => "Pizza place")
      fill_in("restaurant[description]", :with => "Great pizza here!")
      fill_in("restaurant[rating]", :with => "4")
      click_button("Submit")
    end

    it 'each restaurant should have its own page' do
      visit '/restaurants/'
      expect(page).to have_link('View Pizza place')
    end

    it 'the page of each restaurant should have its name, description and rating' do
      @restaurant = Restaurant.first
      visit "/restaurants/#{@restaurant.id}"
      expect(page).to have_content('Pizza place')
      expect(page).to have_content('Great pizza here!')
    end
  end

  context 'editing restaurants' do
  end

  context 'deleting restaurants' do

    it 'a user should be able to delete a restaurant' do
      visit '/restaurants/new'
      fill_in("restaurant[name]", :with => "Pizza place")
      fill_in("restaurant[description]", :with => "Great pizza here!")
      fill_in("restaurant[rating]", :with => "4")
      click_button("Submit")
      click_link 'Delete Pizza place'
      expect(page).not_to have_content 'Pizza place'
      expect(page).to have_content 'Restaurant deleted successfully'
    end

  end

end