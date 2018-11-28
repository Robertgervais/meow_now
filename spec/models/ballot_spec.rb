require "rails_helper"

RSpec.describe Ballot, type: :model do
  describe "factory" do
    it "creates" do
      ballot = FactoryBot.create(:ballot)
      expect(ballot.id).to be_present
    end
  end
  describe "votable" do
    context "has expired" do
    end
    context "has not expired" do
    end
  end   
end
