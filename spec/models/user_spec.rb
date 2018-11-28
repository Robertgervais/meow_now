require "rails_helper"

RSpec.describe User, type: :model do
  describe "factory" do
    it "exists" do
      user = FactoryBot.create(:user)
      expect(user.id).to be_present
    end
  end
end
