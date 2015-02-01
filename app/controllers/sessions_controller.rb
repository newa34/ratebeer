class SessionsController <ApplicationController
	def new

	end

	def create
		#username for the database
		user = User .find_by username: params[:username]

		#deposite with the session id of the logged in user (if exists)
		session[ :user_id] = user.id if not user.nil?
		#will redicted a user on separate page

		redirect_to user

	end

	def destroy
		#session destroy

		session[:user_id] = nil

		redirect_to :root
	end
end
