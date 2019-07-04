FactoryBot.define do
  factory :ballot do
    user { FactoryBot.create(:user) }
    options { "Yes, No" }
    content { "It's! A! Ballot!" }
  end
end
