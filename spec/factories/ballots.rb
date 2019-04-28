FactoryBot.define do
  factory :ballot do
    user { FactoryBot.create(:user) }
  end
end
