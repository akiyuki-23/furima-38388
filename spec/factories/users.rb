FactoryBot.define do
  factory :user do
    nickname              { 'テスト太郎' }
    email                 { Faker::Internet.free_email }
    password              { 'test1234' }
    password_confirmation { password }
    last_name             { '田中'}
    first_name            { '太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birth_date            { '1960-01-01' }
  end
end