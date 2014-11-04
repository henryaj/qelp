require 'rails_helper'

describe 'endorsing reviews' do

  def sign_up
    visit '/users/sign_up'
    fill_in 'user_email', with: "h@h.com"
    fill_in 'user_password', with: 'hellodave'
    fill_in 'user_password_confirmation', with: 'hellodave'
    click_button 'Sign up'
  end

  it 'a user can endorse a review, which updates the review endorsement count', js: true do
    @kfc = Restaurant.create(name: 'KFC')
    sign_up
    @kfc.reviews.create(rating: 3, content: "It was an abomination")
    visit "/restaurants/#{@kfc.id}"
    click_link 'Endorse'
    expect(page).to have_content('1 endorsement')
  end

  it 'a user cannot endorse a review if they are not logged in', js: true do
    @kfc = Restaurant.create(name: 'KFC')
    @kfc.reviews.create(rating: 3, content: "It was an abomination")
    sign_up
    visit "/restaurants/#{@kfc.id}"
    click_link 'Endorse'
    expect(page).to have_content('0 endorsements')
  end

  
end