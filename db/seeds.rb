# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#------------------------------REAL SEEDS --------------------------------------
# These are the actual plans that need to be seeded into the DB when implementing for realz
# plans = Plan.create([{name: 'Weekly', freq: '1.week'},{name: 'Bi-weekly', freq: '2.weeks'},{name: 'Monthly', freq: '1.month'} ])





#-------------------------------FAKE SEEDS -----------------------------------------------------------
# This is just some fake user data. Turn off validations on the user model for this to work. It just copies the password of whatever user you last created through the form, so make sure you know what that password is for loggin any fake users in.
# p = User.last.crypted_password
# s = User.last.salt

# 100.times do |i|

# User.create({
#   email: "a#{i}",
#   crypted_password: p,
#   salt: s,
#   activation_state: "active"
#   }
# )
# end


#------------------------------------------------------------------------------------------
# This will populate fake Subscription data: 1 Subscription for every user. Count your total numbr of users yourself - I had 104.
# the fridays_dropdown method is copied from subscriptions_helper.rb as it seems it can't be called from here

# def fridays_dropdown
# 	fridays = []
# 	today = Date.today


# 	# Find the next friday from today
# 	(1..6).each do |i|
# 		fridays[0] = (today + i.days) if (today + i.days).wday == 5
# 	end

# 	(1..10).each do |i|
# 		fridays[i] = (fridays[0] + i.weeks)
# 	end

# 	fridays

# end

# 104.times do |i|
# Subscription.create({
# 	user_id: i+1,
# 	plan_id: rand(1..3),
# 	n_packs: rand(1..8),
# 	first_delivery_date: fridays_dropdown[rand(0..9)]
# 	})
# end

