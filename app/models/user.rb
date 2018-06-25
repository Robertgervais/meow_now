class User < ApplicationRecord
	has_secure_password

	validates :email, :password_digest, presence: true
	validates :email, uniqueness: true

	has_many :votes
	has_many :posts
	has_many :ballots

end
