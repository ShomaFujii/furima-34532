FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"unnmo1924"}
    password_confirmation {password}
    first_name_character  {'藤井'}
    last_name_character   {'翔'}
    first_name_kana       {'フジイ'}
    last_name_kana        {'ショウ'}
    birthday              {'1942-01-01'}
  end
end