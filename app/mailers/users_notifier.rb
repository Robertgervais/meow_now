
class UsersNotifier < ActionMailer::Base
  default :from => "any_from_address@example.com"

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail(:to => @user.email,
         :subject => "New ballot, cats!")
  end

  def ballot_email(ballot)
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
