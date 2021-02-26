FactoryBot.define do
  factory :item do
    discribe {Faker::Lorem.sentence}
    name  {Faker::Name.initials(number: 2)}
    condition_id  {'2'}
    category_id {'2'}
    shipping_fee_id {'2'}
    prefecture_id {'2'}
    delivery_date_id {'2'}
    price {'2000'}
           
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
