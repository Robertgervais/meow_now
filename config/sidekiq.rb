Sidekiq.configure_server do |config|
  config.periodic do |mgr|
    mgr.register("* * * * *", ReminderEmailWorker)
  end
end
