# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

kfc = Restaurant.create(:name => "KFC")
kfc.reviews.create(rating: 1, content: "vile")
kfc.reviews.create(rating: 2, content: "nice")
kfc.reviews.create(rating: 2, content: "fucked up")
kfc.reviews.create(rating: 4, content: "extraordinary")
kfc.reviews.create(rating: 3, content: "gross")

jamies = Restaurant.create(:name => "Jamie's Italian")
jamies.reviews.create(rating: 1, content: "awful")
jamies.reviews.create(rating: 2, content: "he swore at me")
jamies.reviews.create(rating: 2, content: "why is his tongue like that")
jamies.reviews.create(rating: 4, content: "inedible")
jamies.reviews.create(rating: 3, content: "help me")