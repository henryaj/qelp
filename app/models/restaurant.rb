class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3, message: "That restaurant name is too short."}, uniqueness: true
end
