module UsersHelper

	def count_new_users
		User.recent.where(admin: false).count
	end

	def count_all_users
	 User.where(admin: false).count
	end

	def count_new_admins
		User.recent.where(admin: true).count
	end

	def count_all_admins
	 User.where(admin: true).count
	end
end
