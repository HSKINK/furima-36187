FactoryBot.define do
  factory :item do
    product     { Faker::String.random }
    description { Faker::String.random }
    category_id { Faker::Number.between(from: 2, to: 11) }
    content_id  { Faker::Number.between(from: 2, to: 7) }
    charge_id   { Faker::Number.between(from: 2, to: 3) }
    area_id     { Faker::Number.between(from: 2, to: 48) }
    ship_id     { Faker::Number.between(from: 2, to: 4) }
    price       { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
