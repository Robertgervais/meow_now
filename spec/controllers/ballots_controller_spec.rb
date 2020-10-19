require "rails_helper"

RSpec.describe BallotsController, type: :controller do
  describe "index" do
    let(:user) { FactoryBot.create(:user_confirmed) }
    it "renders" do
      login_user(user)
      get :index
      expect(response).to be_successful
      expect(response).to render_template("index")
    end
  end
  describe "show" do
    let(:user) { FactoryBot.create(:user_confirmed) }
    let(:ballot) { FactoryBot.create(:ballot) }
    it "renders" do
      login_user(user)
      ballot.reload
      get :show, params: { id: ballot.id }
      expect(response).to be_successful
      expect(response).to render_template("show")
    end
  end
  describe "new" do
    let(:user) { FactoryBot.create(:user_confirmed) }
    let(:ballot) { FactoryBot.create(:ballot) }
    it "renders" do
      login_user(user)
      ballot.reload
      get :new, params: { id: ballot.id }
      expect(response).to be_successful
      expect(response).to render_template("new")
    end
  end
  describe "close" do
    let(:user) { FactoryBot.create(:user_confirmed) }
    let(:ballot) { FactoryBot.create(:ballot) }
    it "closes the ballot" do
      login_user(user)
      ballot.reload
      # Need to fix this format thing, params are sending weird but that's what I'm testing rn
      put :close, params: { format: ballot.id }
      ballot.reload
      expect(ballot.votable).to be false
      expect(response).to redirect_to ballots_path
    end
  end
end
