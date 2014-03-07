class Admin::DashboardController < ApplicationController
	before_filter :require_admin

	def index
		@users = User.all
		@plans = Plan.all
		@subscriptions = Subscription.all
	end

end
