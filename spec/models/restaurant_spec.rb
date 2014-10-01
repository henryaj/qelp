require 'spec_helper'

RSpec.describe Restaurant, :type => :model do
  it 'is not valid when name is fewer than three characters' do
    restaurant = Restaurant.new(name: 'KF')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'restaurant name is invalid if it is not unique' do
      Restaurant.create(name: "The Ivy")
      restaurant = Restaurant.new(name: "The Ivy")
      expect(restaurant).to have(1).error_on(:name)
    end
end