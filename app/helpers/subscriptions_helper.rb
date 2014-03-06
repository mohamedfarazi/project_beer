module SubscriptionsHelper
	# This generates a list of the next 10 fridays for the drop-down menu on new subscription form
	def fridays_dropdown
		fridays = []
		today = Date.today


		# Find the next friday from today
		(1..6).each do |i|
			fridays[0] = (today + i.days) if (today + i.days).wday == 5
		end

		(1..10).each do |i|
			fridays[i] = (fridays[0] + i.weeks)
		end

		fridays

	end
end
