class Rating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user 

  def to_s
	return "#{self.beer.name} #{self.score}"
  end
  
end
