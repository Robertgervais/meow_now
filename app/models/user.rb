class User < ApplicationRecord
	has_secure_password
	before_create :downcase_email

	validates :email, :password_digest, presence: true
	validates :email, :username, uniqueness: true

	has_many :votes
	has_many :ballots

	def downcase_email
		self.email.downcase!
	end

end
