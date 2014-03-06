class Admin::UsersController < ApplicationController



	def index
		@users = User.all
		@plans = Plan.all
		@subscriptions = Subscription.all
	end


end
