class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  include RatingAverage
	
  def to_s
     return "#{self.name}, #{self.brewery.name}"
   end

  def average
	if ratings.count == 0 
	   return 0
	end
	ratings.map { |b| b.score}.sum / ratings.count.to_f
  end
end
