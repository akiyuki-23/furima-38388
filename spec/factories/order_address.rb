FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { '2' }
    city { '千歳市' }
    address { '知曲2-5' }
    building { 'コーポ千歳' }
    phone_number { '04098764548' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end