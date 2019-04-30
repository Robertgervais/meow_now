module VotesHelper
  def user_has_already_voted
    current_user.votes.find_by(ballot_id: params[:ballot_id])
  end

  def a_list
    users = User.select { |user| user.membership == "B" && user.active }
  end

  def find_users_that_have_not_voted(ballot_id)
    not_voted = []
    a_list.each do |user|
      if !(user.votes.find_by(ballot_id: ballot_id))
        not_voted << user
      end
    end
    not_voted
  end
end
