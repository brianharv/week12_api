class Location < ApplicationRecord
  validates :country, :city, presence: true

  scope :search_by_rating, -> (rating_parameter) {where(rating: "#{rating_parameter}")}

  scope :top_rated,  -> { order(rating: :desc).limit(100) } 

  has_many :reviews, dependent: :destroy

end