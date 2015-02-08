class Brewery < ActiveRecord::Base
	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers
	
	include RatingAverage	
	validates :name, presence: true, allow_blank: false
	validates :year, numericality: {only_integer: true, greater_than_or_equal_to: 1042}
	validate :year_current

	def year_current
		if year > Time.now.year
			errors.add(:year, "Year cannot be Future ")
		end
	end
end