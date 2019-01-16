class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :ballot

  validates :user_vote, presence: true

	def voter
		User.find(self.user_id)
	end
end
