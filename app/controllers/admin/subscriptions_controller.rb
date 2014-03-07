class Admin::SubscriptionsController < ApplicationController

	before_filter :require_admin

	def index
		@subscriptions = Subscription.all
	end

end
