module BallotHelper
  def find_comments(ballot)
    ballot.votes.select { |vote| !vote.comment.nil? }
  end

  def ballot_has_votes
    Ballot.find(params[ballot_id]).votes
  end

  def open_ballots
    Ballot.all.select { |ballot| !(ballot.all_expiration_requirements_met?) && ballot.votable }
  end

  def find_expired
    Ballot.all.select { |ballot| ballot.expired? }
  end

  def closed?(ballot)
    !ballot.votable
  end
end
