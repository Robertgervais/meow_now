require 'rails_helper'
RSpec.describe ReminderEmailWorker, type: :worker do
  let(:user) {FactoryBot.create(:user_confirmed)}
  it "queues up a reminder email" do

  end
end
