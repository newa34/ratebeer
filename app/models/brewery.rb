class Brewery < ActiveRecord::Base
	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers
	
	include RatingAverage	
	validates :year, numericality: {only_integer: true, greater_than_or_equal_to: 1042, less_than_or_equal_to: 2015}
end
