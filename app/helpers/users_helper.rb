module UsersHelper
	def count_new
		User.recent.where(admin: false).count
	end

	def count_all
	 User.where(admin: false).count
	end
end
