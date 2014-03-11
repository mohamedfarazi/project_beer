class Delivery < ActiveRecord::Base
	belongs_to :user
	belongs_to :subscription

	validates :subscription_id, uniqueness: { scope: :expected_date }
	# scope :by_postcode, -> { order(postal_code: :asc) }

	scope :by_postcode, :joins => :user, :order => "users.postal_code ASC"
end
