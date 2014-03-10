class Admin::DeliveriesController < ApplicationController
	include Admin::SubscriptionsHelper

	def upcoming
		@subscriptions = Subscription.all
	end

	def manifest_create
		@subscriptions = Subscription.all

		@subscriptions.each do |sub|
			# 1. set next_date to their first first_delivery_date
			next_date = sub.first_delivery_date
			# 2. keep adding their plan's freq interval until next_date is no longer in the past
			while next_date < Date.today do
				next_date += eval(sub.plan.freq)
			end

			if next_date == this_friday
				deliv = Delivery.new
				deliv.user_id = sub.user_id
				deliv.subscription_id	= sub.id
				deliv.expected_date = this_friday
				deliv.delivered = false
				# NJ: not sure what kind of error handling can be done here from within the loop? Retry?
				deliv.save
			end

		end

		redirect_to admin_deliveries_manifest_path
	end

	def manifest_show

	end

end
