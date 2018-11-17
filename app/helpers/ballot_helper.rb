module BallotHelper

	def ballot_has_votes
		Ballot.find(params[ballot_id]).votes
	end

	def open_ballots
		Ballot.all.select{|ballot| !(ballot.all_expiration_requirements_met?)}
	end

	def find_expired
		Ballot.all.select{|ballot| ballot.expired?}
	end

end
