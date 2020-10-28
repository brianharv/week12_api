# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed

  def self.begin
    seed = Seed.new
    Location.destroy_all
    seed.generate_location_with_reviews
  end
  
  def generate_location_with_reviews
    20.times do |i|
      location = Location.create!(
        country: Faker::Address.country,
        city: Faker::Address.city
      )
      5.times do |j|
        review = location.reviews.create!(
          username: Faker::Internet.username,
          body: Faker::TvShows::MichaelScott.quote,
          rating: (rand 1..5),
        )
      end
      puts "location #{i}: #{location.country} has #{location.reviews.length} reviews."
    end
  end

  # def generate_reviews
  #   50.times do |j|
  #     review = Review.create!(
  #       username: Faker::Internet.username,
  #       body: Faker::Lorem.words(number: 50),
  #       rating: (rand 1..5),
  #     )
  #     puts "Review #{i}: Destination: #{review.city}, #{review.country} Author: #{review.username} Body: '#{review.body}' Rating: #{review.rating}."
  #   end
  # end
end  

Seed.begin