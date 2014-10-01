class Review < ActiveRecord::Base
  belongs_to :restaurant
  has_many :endorsements
  validates :rating, inclusion: { in: [1,2,3,4,5], message: "Your rating must be between 1 to 5."}
end
