class User < ActiveRecord::Base
	
	include RatingAverage
	
	has_secure_password

	has_many :beers, through: :ratings
	has_many :beer_clubs, through: :memberships
	has_many :ratings, dependent: :destroy
	has_many :memberships, dependent: :destroy

	validates :username, uniqueness: true, length: {minimum: 3, maximum: 15}
	validates :password_confirmation, presence: true
	validates :username, length: {minimum: 4}
	validates :password, format: { with: /\d.*[A-Z]|[A-Z].*\d/,  message: "has to contain one number and one upper case letter" }

	def favorite_beer
	return nil if ratings.empty?
	# ratings.sort_by{ |r| r.score }.last.beer
	ratings.order(score: :desc).limit(1).first.beer
	end

	def favorite_style
	return nil if ratings.empty?
	beers.group(:style).average(:score).max_by { |name, score| score }.first
	end
	
end
