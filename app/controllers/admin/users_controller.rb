class Admin::UsersController < ApplicationController

	before_filter :require_admin

	def index
			@users = User.all.recent_first
	end

	def recent
		@users = User.recent.recent_first
	end

end