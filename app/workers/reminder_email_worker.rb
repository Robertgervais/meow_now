class ReminderEmailWorker
  include Sidekiq::Worker

  def perform
    find_reminders.each do |job|
      send_email(job.id)
    end
  end

  def self.find_reminders
    reminders_array = []
    ReminderEmail.where("next_run_at <= ?", Time.now).find_each do |job|
      reminders_array << job
    end
    reminders_array
  end

  def self.send_email(ballot_id)
    @ballot = Ballot.find(ballot_id)
    if !@ballot.enough_votes?
      @users = @ballot.find_users_that_have_not_voted(@ballot.id)
      UsersNotifier.send_reminder(@ballot, @users).deliver
      job.update_attribute!(next_run_at: job.next_run_at + 1.day)
    else
      job.destroy
    end
  end
end
