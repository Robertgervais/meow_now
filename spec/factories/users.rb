FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@cccballot.com" }
    password { "hellopassword" }
    sequence(:username) { |n| "User #{n.to_s.rjust(3, "0")}" }
    factory :user_confirmed do
      active { true }
      confirmed { true }
      membership { "B" }
      factory :admin do
        admin { true }
      end
    end
  end
end
