module VotesHelper

	def user_has_already_voted
		current_user.votes.find_by(ballot_id: params[:ballot_id])
	end
end
