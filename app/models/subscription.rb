class Subscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :plan


	validates :plan_id, presence: true
	validates :n_packs,  numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
