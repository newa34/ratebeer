class User < ActiveRecord::Base
	include RatingAverage
	
	has_secure_password

	has_many :beers, through: :ratings
	has_many :memberships, dependent: :destroy
	has_many :beer_clubs, through: :memberships
	has_many :ratings

	validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}
	validates :password_confirmation, presence: true
	validates :password, format: {with: /(?=.*\d)/, message: "Atleast one number"}
	validates :password, format: {with: /(?=.*[A-Z])/, message: "Atleast one uppercase"}

end
