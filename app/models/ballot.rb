class Ballot < ActiveRecord::Base

	belongs_to :user
	has_many :votes
	before_create :set_expiration_date, :set_votable

	validates :options, presence: true


	def expired?
		Time.now < self.expiration
	end

	def has_support?
		self.support_first && self.support_second
	end

	def all_expiration_requirements_met?
		enough_votes? && expired?
	end

	def support
		if support_first && support_second
			support = "This ballot is supported by #{support_first} and #{support_second}"
		elsif support_first
			support = "This ballot is supported by #{support_first}"
		else
			support = "Ballot has no support yet"
		end
	end

	def voters
		users = []
		self.votes.each do |vote|
			users << vote.voter
		end
		users
	end

	def voters_with_choice
		combo = Hash.new
		voters.each do |voter|
			combo[voter] = self.votes.find_by(user_id: voter.id).user_vote
		end
		combo
	end


	def tally
		tallied_votes = Hash.new
		if too_many_b_members
			get_options.each do |option|
				tallied_votes.store[option] = get_results_count(option)
			end
		else
			get_options.each do |option|
				tallied_votes[option] = get_results_weighted(option)
			end
		end
		tallied_votes
	end

	def how_many(membership)
		ballot_votes.select{|vote| vote.user.membership == "#{membership}"}.count
	end
	private
	def set_expiration_date
		if self.include_weekend
			self.expiration = DateTime.now + 96.hours
		else
			self.expiration = DateTime.now + 48.hours
		end
	end

	def set_votable
		self.votable ||= true
	end

	def get_options
		ballot_votes.select(:user_vote).map(&:user_vote).uniq
	end

	def get_b_weight
		(how_many("A") / 4) / how_many("B").to_f
	end
	
	
	def get_results_count(option)
		ballot_votes.select {|vote| vote.user_vote == option}.count
	end

	def get_results(option)
		ballot_votes.select {|vote| vote.user_vote == option}
	end

	def get_results_weighted(option)
		count = 0
		get_results(option).each do |vote|
			if vote.user.membership == "A"
				count += 1
			elsif vote.user.membership == "B"
				count += get_b_weight
			end
		end
		count
	end

	def too_many_b_members
		if how_many("B") > 0
			(how_many("B") / how_many("A")).to_f < 0.2
		else
			false
		end
	end

	def ballot_votes
		self.votes
	end

	def enough_votes?
		(how_many("A") / User.all.select{|user| user.membership == "A"}.count).to_f >= 0.75
	end

end
