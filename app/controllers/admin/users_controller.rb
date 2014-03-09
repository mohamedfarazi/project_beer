class Admin::UsersController < ApplicationController

	before_filter :require_admin

	def index
			@users = User.all
	end

	def recent
		@users = User.recent
	end

end