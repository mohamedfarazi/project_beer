class RemoveUserIdFromDeliveries < ActiveRecord::Migration
	def change
	    remove_column :deliveries, :user_id, :string
	    remove_column :deliveries, :subscription_id, :string
  end
end
