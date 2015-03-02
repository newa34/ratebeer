class AddConfirmToMembership < ActiveRecord::Migration
  def change
	add_column :memberships, :confirm, :boolean
	
	for user in Membership.all
		user.update_attribute 'confirm', true
	end
  end
end
