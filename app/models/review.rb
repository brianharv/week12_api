class Review < ApplicationRecord
  validates :username, :body, :rating, :country, :city, presence: true
end  