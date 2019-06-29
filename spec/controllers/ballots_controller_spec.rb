require "rails_helper"

RSpec.describe BallotsController, type: :controller do
  describe "new" do
    before do
      login_with FactoryBot.create(:user_confirmed)
    end
    it "renders" do
      new_ballot_path
      expect(response).to be_success
      expect(response).to render_template("new")
    end
  end
end
