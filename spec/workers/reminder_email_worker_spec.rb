require 'rails_helper'

RSpec.describe ReminderEmailWorker, type: :worker do
  let(:user) {FactoryBot.create(:user_confirmed)}
  let(:reminder_email) {FactoryBot.create(:reminder_email)}
  describe "find_reminders" do
    it "finds an array of reminders that need to be sent" do
      reminder_email.reload
      expect(ReminderEmailWorker.find_reminders.length).to eq(1)
    end
  end
  describe "send_email" do
    it "sends the email if there's an eligible reminder" do
      ActionMailer::Base.deliveries = []
      reminder_email.reload
      ReminderEmailWorker.send_email(Ballot.last.id)
      expect(ActionMailer::Base.deliveries.length).to eq(1)
    end
    it "destroys the email if it's ineligible" do
    end
  end
end
