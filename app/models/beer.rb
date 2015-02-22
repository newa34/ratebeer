class Beer < ActiveRecord::Base
  include RatingAverage
  
  belongs_to :style
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user

  validates :name, presence: true, allow_blank: false
  validates :style, presence: true

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
