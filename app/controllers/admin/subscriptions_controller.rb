class Admin::SubscriptionsController < ApplicationController

	before_filter :require_admin

	def index
		@subscriptions = Subscription.all.recent_first
	end

	def recent
		@subscriptions = Subscription.recent.recent_first
	end

	def upcoming
		@subscriptions = Subscription.all
	end

end
