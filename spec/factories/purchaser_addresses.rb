FactoryBot.define do
  factory :purchaser_address do
      zip_code { '123-4567' }
      prefecture_id { 9 }
      city { '東京都' }
      street_number { '1-1' }
      building { '東京ハイツ' }
      phone_number {'09009878876'}
      token {"tok_abcdefghijk00000000000000000"}
  end
end
