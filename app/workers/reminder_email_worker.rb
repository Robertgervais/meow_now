class ReminderEmailWorker
  include Sidekiq::Worker

  def perform
    ReminderEmail.where("next_run_at <= ?", Time.now).find_each do |job|
      @ballot = Ballot.find(job.ballot_id)
      if !@ballot.enough_votes?
        @users = @ballot.find_users_that_have_not_voted(@ballot.id)
        UsersNotifier.send_reminder(@ballot, @users).deliver
        job.update_attribute!(next_run_at: job.next_run_at + 1.day)
      else
        job.destroy
      end
    end
  end
end
