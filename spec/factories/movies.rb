FactoryBot.define do
  factory :movie do
    name { Faker::Movie.title }
    description { Faker::Movie.quote }
    released_on { "2023-09-21 13:27:40" }
  end
end
