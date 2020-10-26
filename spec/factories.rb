FactoryBot.define do
  factory(:review) do
    username {Faker::Name.name}
    body {Faker::Movie.quote}
    rating {rand(1..5)}
    country {Faker::Address.country}
    city {Faker::Address.city }
  end
end