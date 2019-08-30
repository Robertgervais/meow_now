require "rails_helper"

RSpec.describe UsersNotifier, type: :mailer do
  let(:user) { FactoryBot.create(:user_confirmed) }
  let(:ballot) {FactoryBot.create(:ballot, ballot_issue: "Hi")}
  let(:all_users) {User.all}
  describe "send_signup_email" do
    it "renders an email" do
      mail = UsersNotifier.send_signup_email(user)
      expect(mail.subject).to eq("One of us!")
      expect(mail.from).to eq(["ccballot.sick&tight.com"])
      expect(mail.to).to eq([user.email])
    end
  end
  describe "ballot_email" do
    it "renders an email" do
      mail = UsersNotifier.ballot_email(ballot)
      expect(mail.subject).to eq("New ballot, cats!")
      expect(mail.from).to eq(["ccballot.sick&tight.com"])
    end
  end
  describe "close" do
    it "renders an email" do
      mail = UsersNotifier.close(ballot)
      expect(mail.subject).to eq("Hi's been closed!")
      expect(mail.from).to eq(["ccballot.sick&tight.com"])
    end
  end
  describe "send_reminder" do
    it "renders an email" do
      mail = UsersNotifier.send_signup_email(user)
      expect(mail.subject).to eq("One of us!")
      expect(mail.from).to eq(["ccballot.sick&tight.com"])
    end
  end
end