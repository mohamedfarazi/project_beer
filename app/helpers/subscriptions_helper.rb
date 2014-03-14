module SubscriptionsHelper

	# This generates a list of the next 10 fridays for the drop-down menu on new subscription form
	def fridays_dropdown
		fridays = []
		today = Date.today
		# Find the next friday from today
		(1..7).each do |i|
			fridays[0] = (today + i.days) if (today + i.days).wday == 5
		end

		(1..10).each do |i|
			fridays[i] = (fridays[0] + i.weeks)
		end

		fridays

	end

	def next_delivery
			# 1. set next_date to their first first_delivery_date
			next_date = @subscription.first_delivery_date
			# 2. keep adding their plan's freq interval until next_date is no longer in the past
			while next_date < Date.today do
				next_date += eval(@subscription.plan.freq)
			end
			# 3. if their next_date is this_friday, add them to the list of this week's deliveries
			next_date
	end

end
