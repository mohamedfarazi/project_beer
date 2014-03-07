class User < ActiveRecord::Base
  authenticates_with_sorcery!

	validates :password, length: {minimum: 3},  :on => :create
	validates :password, confirmation: true,  :on => :create
	validates :password_confirmation, presence: true,  :on => :create


validates :email, uniqueness: true
validate :postal_code_format


	has_one :subscription
	has_one :plan, through: :subscription

 def check_postal_code
 	allowed = ["M4X", "M4Y", "M5A", "M5B", "M5E", "M5J", "M5G", "M5S", "M5T", "M5V", "M6J", "M6K", "M6G", "M6H"]
     allowed.each do |p|
     	return true if postal_code.upcase.include? p

      end
      false
    end

	def postal_code_format
		unless postal_code.split.join.upcase =~ /[A-Z]\d[A-Z]\d[A-Z]\d/
			errors.add(:postal_code, "must be in the correct format.")
		end

	end

end
