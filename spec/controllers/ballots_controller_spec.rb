require "rails_helper"

RSpec.describe BallotsController, type: :controller do
  describe "index" do
    it "renders" do
      login_user
      ballots_path
      expect(response).to be_success
      expect(response).to render_template("index")
    end
  end
end
