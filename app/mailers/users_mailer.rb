class UsersMailer < ApplicationMailer

	def signup_confirmation(user)
		@user = user
		mail to: @user.email, subject: "Welcome to"
	end

	def new_ballot(recipients, ballot, creator)
	    @recipients = recipients
	    @ballot = ballot
	    @creator = creator
	    @message = "Hey Cats, there's a new ballot on '#{@ballot}'. Please vote!"
	    mail(
	      bcc: @recipients.map(&:email).uniq, 
	      subject: "New Ballot created by #{@creator}: #{@ballot}"
	    )
	end
end
