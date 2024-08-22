FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.email}
    password              { 'password123' }
    password_confirmation { 'password123' }
    last_name             {'山田'}
    first_name            {'太郎'}
    kana_last_name        {'ヤマダ'}
    kana_first_name       {'タロウ'}
    birth                 { Date.new(1990, 1, 1) }
  end
end