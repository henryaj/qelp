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

  it 'each restaurant can have an image' do
    expect(ActiveRecord::Base.connection.column_exists?(:restaurants, :image_file_name)).to be true
  end

  it 'has a user who created it' do
    restaurant = Restaurant.create(name: "The Ivy", user_id: 1)
    expect(restaurant.user_id).to eq(1)
  end

  it 'should know its average rating with one review' do
    restaurant = Restaurant.create(name: "The Ivy")
    expect(restaurant.average_rating).to eq("N/A")
  end

  it 'should know its average rating with one review' do
    restaurant = Restaurant.create(name: "The Ivy")
    restaurant.reviews.create(content: "bad", rating: 1)
    expect(restaurant.average_rating).to eq(1)
  end

  it 'should know its average rating with two reviews' do
    restaurant = Restaurant.create(name: "The Ivy")
    restaurant.reviews.create(content: "bad", rating: 1)
    restaurant.reviews.create(content: "not bad", rating: 3)
    expect(restaurant.average_rating).to eq(2)
  end



end