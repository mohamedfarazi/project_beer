class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

private
	def not_authenticated
		redirect_to main_app.login_path, notice: 'Please login first'
	end

	def require_admin
		redirect_to denied_path unless current_user.admin
	end


end