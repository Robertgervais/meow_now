class UsersMailer < ApplicationMailer
	include BallotHelper

	def signup_confirmation(user)
		@user = user
		mail to: @user.email, subject: "Welcome to"
	end

	def new_ballot(recipients, ballot, ballot_issue, creator)
	    @recipients = recipients
	    @ballot_issue = ballot_issue
	    @creator = creator
	    @url = "http://cccballot.com/ballots/#{ballot}"
	    mail(
	      bcc: @recipients.map(&:email).uniq, 
	      subject: "New Ballot created by #{@creator}: #{@ballot_issue}"
	    )
	end

	def send_expired

		Ballot.first
	end
end
