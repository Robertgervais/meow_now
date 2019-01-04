class BallotsController < ApplicationController
	include SessionsHelper
	include BallotHelper
	include VotesHelper

	def index
		if logged_in
			@ballots = Ballot.all
			@open_ballots = open_ballots
		else 
			redirect_to login_path
		end
	end

	def show
		@ballot= Ballot.find(params[:id])
		@radio = @ballot.options.split(",")
		@results = @ballot.tally
	end

	def new
		@ballot = Ballot.new
	end

	def create
		@ballot = Ballot.new(ballot_params)
		@ballot.user_id = current_user.id
		if @ballot.save
			UsersMailer.new_ballot(User.all, @ballot.id, @ballot.ballot_issue, @ballot.user.username).deliver
			redirect_to ballots_path
		else
			@ballot.full_error_messages
			redirect_to new_ballot_path
		end
	end

	def edit
	end

	def pending
		@users = find_users_that_have_not_voted(params[:id])
	end

	def add_support
		@ballot = Ballot.find(params[:id])
		if current_user.id != @ballot.user_id
			if @ballot.support_first == nil
				@ballot.support_first = current_user.username
				@ballot.save
				redirect_to ballot_path(@ballot)
			elsif @ballot.support_second == nil && @ballot.support_first != current_user.username
				@ballot.support_second = current_user.username
				@ballot.save
				redirect_to ballot_path(@ballot)
			else
				redirect_to ballot_path(@ballot)
			end
		else
			redirect_to ballot_path(@ballot)
		end
	end

	def close
		@users = User.all
		@ballot = Ballot.find(params[:format])
		@ballot.update(votable: false)
		UsersMailer.close_ballot(@users, @ballot.id, @ballot.ballot_issue).deliver
		redirect_to ballots_path
	end

	def send_reminder
		@users = find_users_that_have_not_voted(params[:format])
		@ballot_id = params[:format]
		@ballot = Ballot.find(params[:format])
		UsersMailer.send_reminder(@users, @ballot.id, @ballot.ballot_issue).deliver
		redirect_to ballots_path
	end

	def destroy
		@ballot = Ballot.find(params[:id])
		@ballot.destroy
		redirect_to ballots_path
	end

	private
	def ballot_params
		params.require(:ballot).permit(:ballot_issue, :options, :ballot_type, :content, :include_weekend)
	end
end
