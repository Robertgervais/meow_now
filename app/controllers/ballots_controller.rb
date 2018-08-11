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
		@ballot= Ballot.find_by(params[:id])
		if @ballot.first_support == nil
			@ballot.first_support = current_user.username
			@ballot.save
		elsif @ballot.first_support = nil
			@ballot.second_support = current_user.username
			@ballot.save
		else
			redirect_to ballot_path(@ballot)
		end
	end

	private
	def ballot_params
		params.require(:ballot).permit(:ballot_issue, :options, :ballot_type, :content, :include_weekend)
	end
end
