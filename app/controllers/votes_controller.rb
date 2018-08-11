class VotesController < ApplicationController
	include SessionsHelper
	include VotesHelper

	def index
	end

	def create
		@ballot = Ballot.find(params[:ballot_id])
		@vote = @ballot.votes.new(user_vote: params[:cast_vote])
		@vote.user_id = current_user.id
		if !current_user.votes.find_by(ballot_id: params[:ballot_id])
			@vote.save
			redirect_to ballot_path(params[:ballot_id])	
		else
			flash[:alert] = "You've already voted on this ballot"
			redirect_to ballot_path(params[:ballot_id])
		end
	end

	def support
	end
end