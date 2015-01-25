class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :ratings
	
 def average_rating
	if self.ratings.count > 0
		return ratings.inject(0.0) {|sum, n | sum + n.score } / self.ratings.count
	else
		return 0;
	end

 end

 def to_s
    return "#{self.name}, #{self.brewery.name}"
  end
end
