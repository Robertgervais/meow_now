class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :ballot

	def voter
		User.find(self.user_id)
	end
end
