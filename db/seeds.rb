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
    seed.generate_reviews
  end
  
  def generate_reviews
    50.times do |i|
      review = Review.create!(
        username: Faker::Internet.username,
        body: Faker::Lorem.words(number: 50),
        rating: (rand 1..5),
        country: Faker::Address.country,
        city: Faker::Address.city
      )
      puts "Review #{i}: Destination: #{review.city}, #{review.country} Author: #{review.username} Body: '#{review.body}' Rating: #{review.rating}."
    end
  end
end  

Seed.begin