FactoryBot.define do  
  factory :ballot do
    user {FactoryBot.create(:user)}
    options "hi, my, name, is, seth"
  end
end