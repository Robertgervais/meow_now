class BallotCheckWorker
  include Sidekiq::Worker

  def perform
    puts "omg"
  end
end
