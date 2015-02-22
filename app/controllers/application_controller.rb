class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Specifies that the method will use the CURRENT_USER views
  helper_method :current_user
  helper_method :current_user_admin?

  def current_user
  	return nil if session[:user_id].nil?
  	User.find(session[:user_id])
  end

  def current_user_admin?
      user = current_user
      return nil if user.nil?
      current_user.admin
    
  end

  def ensure_that_signed_in
  		redirect_to signin_path, notice:'you should be signed in' if current_user.nil?
  end

  def ensure_that_admin
    #raise on error
    raise ActionController::RoutingError.new('Forbidden') if current_user_admin?
  end

end
