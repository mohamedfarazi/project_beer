class Plan < ActiveRecord::Base
	has_many :subscriptions

	has_many :users, through: :subscriptions

	scope :by_price, -> {order(amount_in_cents: :asc)}
end
