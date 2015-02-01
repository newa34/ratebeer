class SessionsController <ApplicationController
	def new

	end

	def create
		#username for the database
		user = User.find_by username: params[:username]
		if user.nil?
			redirect_to :back, notice: "User #{params[:username]} does not exists!"
		else
		#deposit with the session id of the logged in user (if exists)
		session[ :user_id] = user.id
		#will redicted a user on separate page
		redirect_to user, notice: "Welcome"
		end
	end

	def destroy
		#session destroy

		session[:user_id] = nil

		redirect_to :root
	end
end
