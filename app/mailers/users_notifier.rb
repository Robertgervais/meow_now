
class UsersNotifier < ActionMailer::Base
  default :from => "ccballot.sick&tight.com"

  def send_signup_email(user)
    @user = user
    mail(:to => @user.email,
         :subject => "One of us!")
  end

  def ballot_email(ballot)
    @url = ballot_url(ballot.id)
    @issue = ballot.ballot_issue
    @creator = ballot.user
    @bcc = User.all.pluck(:email)
    mail(:bcc => @bcc,
         :subject => "New ballot, cats!")
  end

  def close(ballot)
    @issue = ballot.ballot_issue
    @totals = ballot.tally
    @bcc = User.all.pluck(:email)
    mail(:bcc => @bcc,
         :subject => "#{@issue}'s been closed!")
  end

  def send_reminder(ballot, users)
    @issue = ballot.ballot_issue
    @users = users.pluck(:email)
    mail(:bcc => @users,
         :subject => "Helllooooo please vote on #{@issue}")
  end
end
