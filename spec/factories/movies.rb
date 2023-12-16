FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    released_on { "2023-09-21 13:27:40" }
    image_file_name { "image.png" }
  end
end
