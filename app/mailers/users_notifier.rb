
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
    @bcc = User.all.pluck(:email)
    mail(:bcc => @bcc,
         :subject => "#{@issue}'s been closed!'")
  end
end
