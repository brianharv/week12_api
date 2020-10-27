class Review < ApplicationRecord
  validates :username, :body, :rating, :country, :city, presence: true


  scope :search_by_rating, -> (rating_parameter) {where(rating: "#{rating_parameter}")}

  scope :top_rated,  -> { order(rating: :desc).limit(100) }

  
  scope :most_reviewed_city,  -> {(
    select("reviews.id, reviews.city, count(tasks.id) as tasks_count")
    .joins(:tasks)
    .group("reviews.id")
    .order("tasks_count DESC")
    .limit(1)
  )}

end