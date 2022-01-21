FactoryBot.define do
  factory :item do
    image              {Faker::Lorem.sentence}
    item               { "カフェラテ" }
    comment            {Faker::Lorem.sentence}
    category_id        { 2 }
    status_id          { 2 }
    area_id            { 2 }
    preparation_day_id { 2 }
    price              { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
