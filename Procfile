web: bundle exec puma -t 5:5 -e ${RACK_ENV:-development}
worker_critical: bundle exec sidekiq -q default
