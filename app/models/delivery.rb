class Delivery < ActiveRecord::Base
	belongs_to :user
	belongs_to :subscription

	validates :subscription_id, uniqueness: { scope: :expected_date }
end
