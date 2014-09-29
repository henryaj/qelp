require 'rails_helper'

describe 'restaurant' do
  context 'without any restaurants' do
    it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_link('Add a restaurant')
      expect(page).to have_content('No restaurants')
    end
  end
end