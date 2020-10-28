FactoryBot.define do
  factory(:review) do
    username {Faker::Name.name}
    body {Faker::Movie.quote}
    rating {rand(1..5)}
    # country {Faker::Address.country}
    # city {Faker::Address.city }
    location
  end

  factory(:location) do
    country {Faker::Address.country}
    city {Faker::Address.city }

    factory(:location_with_reviews) do

      transient do
        reviews_count { 5 }
      end

      after(:create) do |location, evaluator|
        create_list(:review, evaluator.reviews_count, location: location)
      end
    end
  end
end