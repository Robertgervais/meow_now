FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email-#{n}@example.com" }
    sequence(:username) { |n| "User #{n.to_s.rjust(3, "0")}" }
    password { "hellopassword" }
    factory :user_confirmed do
      confirmed { true }
      active { true }
      membership { "B" }
      factory :admin do
        admin { true }
      end
    end
  end
end
