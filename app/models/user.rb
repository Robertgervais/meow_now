class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_secure_password
	before_create :downcase_email
	before_create :default_values

	validates :email, :password_digest, presence: true
	validates :email, :username, uniqueness: true

	has_many :votes
	has_many :ballots

	def downcase_email
		self.email.downcase!
	end
	def default_values
    self.confirmed ||= false
  end

end
