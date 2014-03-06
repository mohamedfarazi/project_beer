class User < ActiveRecord::Base
  authenticates_with_sorcery!

validates :password, length: {minimum: 3}
validates :password, confirmation: true
validates :password_confirmation, presence: true
validates :email, uniqueness: true

has_one :subscription
has_one :plan, through: :subscription

 def check_postal_code
 	allowed = ["M4X", "M4Y", "M5A", "M5B", "M5E", "M5J", "M5G", "M5S", "M5T", "M5V", "M6J", "M6K", "M6G", "M6H"]
     allowed.each do |p|
     	return true if postal_code.upcase.include? p

      end
      false
    end
end
