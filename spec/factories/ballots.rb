FactoryBot.define do
  factory :ballot do
    user { FactoryBot.create(:user) }
    options { "Yes, No" }
  end
end
