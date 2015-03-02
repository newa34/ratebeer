class BeerClub < ActiveRecord::Base
	has_many :memberships
	has_many :members,  through: :memberships, source: :user

	def to_s
    	"#{self.name}, #{self.city}"
  	end

  	def isMemberAndConfirmed(user)
  		u = self.memberships.find_by(user_id: user.id, beer_club_id: self.id)
  		if u.nil?
  			return false
  		elsif !u.confirm
  			return false
  		else
  			return true
  		end
  	end

end
