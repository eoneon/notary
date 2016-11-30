FactoryGirl.define do
  factory :location do
    address Faker::Address.street_address
    locatable nil
  end
end
