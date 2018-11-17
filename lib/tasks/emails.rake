task :mailme => :environment do
  UserMailer.test_email(1).deliver
end