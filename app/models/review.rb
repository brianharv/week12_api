class Review < ApplicationRecord
  validates :username, :body, :rating, presence: true

  scope :search_by_rating, -> (rating_parameter) {where(rating: "#{rating_parameter}")}

  scope :top_rated,  -> { order(rating: :desc).limit(100) } 

  belongs_to :location

end