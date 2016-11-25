FactoryGirl.define do
  pw = Faker::Internet.password(6)
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    commission_number Faker::Number.number(8)
    commission_expiration Faker::Date.forward(365)
  end
end
