module SubscriptionsHelper
	# This generates a list of the next 10 fridays for the drop-down menu on new subscription form
	def fridays_dropdown
		fridays = []
		today = Date.toda
		# Find the next friday from today
		(1..6).each do |i|
			fridays[0] = (today + i.days) if (today + i.days).wday == 5
		end

		(1..10).each do |i|
			fridays[i] = (fridays[0] + i.weeks)
		end

		fridays

	end
	# Find next Friday: this is different from the fridays_dropdown method above in that this_friday can be today if the list of upcoming deliveries is generated on a friday
	def this_friday
		fri = Date.new

		(0..6).each do |i|
			fri = (Date.today + i.days) if (Date.today + i.days).wday == 5
		end

		fri
	end

	def upcoming(subs)
		# the list of subscriptions with deliveries scheduled for this week
		list = []
		# for each active subscription, check if their next delivery is this week
		subs.each do |sub|
			# 1. set next_date to their first first_delivery_date
			next_date = sub.first_delivery_date
			# 2. keep adding their plan's freq interval until next_date is no longer in the past
			while next_date < Date.today do
				next_date += sub.plan.freq
			end
			# 3. if their next_date is this_friday, add them to the list of this week's deliveries
			list << sub if next_date == this_friday
		end

		list
	end

	def upcoming_totals(list)
		total = 0
		n = list.length-1

		(0..n).each do |i|
			total += list[i][:n_packs]
		end

		total
	end
end
