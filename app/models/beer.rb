class Beer < ActiveRecord::Base
  include RatingAverage
  
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  validates :name, presence: true, allow_blank: flase
  

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
