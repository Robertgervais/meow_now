FactoryBot.define do
  factory :reminder_email do
    let(:ballot) {FactoryBot.create(:ballot)}
    ballot_id  { ballot.id }
    next_run_at { Time.now }
  end
end
