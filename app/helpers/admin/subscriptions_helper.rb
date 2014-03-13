module Admin::SubscriptionsHelper

	def count_new_subs
		Subscription.recent.count
	end

	def count_all_subs
		Subscription.all.count
	end

	def count_w_subs
		id = Plan.where(freq: "1.week").take.id
		Subscription.where(plan_id: id).count
	end

	def count_b_subs
		id = Plan.where(freq: "2.weeks").take.id
		Subscription.where(plan_id: id).count
	end

	def count_m_subs
		id = Plan.where(freq: "1.month").take.id
		Subscription.where(plan_id: id).count
	end

	# Find next Friday: this is different from the fridays_dropdown method above in that this_friday can be today if the list of upcoming deliveries is generated on a friday
	def this_friday
		fri = Date.new

		(0..6).each do |i|
			fri = (Date.today + i.days) if (Date.today + i.days).wday == 5
		end

		fri
	end

	def upcoming_deliveries
		# the list of subscriptions with deliveries scheduled for this week
		list = []
		# for each active subscription, check if their next delivery is this week
		@subscriptions.each do |sub|
			# 1. set next_date to their first first_delivery_date
			next_date = sub.first_delivery_date
			# 2. keep adding their plan's freq interval until next_date is no longer in the past
			while next_date < Date.today do
				next_date += eval(sub.plan.freq)
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