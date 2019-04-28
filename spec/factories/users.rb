FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@cccballot.com" }
  end
end
