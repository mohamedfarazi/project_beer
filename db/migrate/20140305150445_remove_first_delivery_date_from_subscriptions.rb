class RemoveFirstDeliveryDateFromSubscriptions < ActiveRecord::Migration
  def change
  	change_table :subscriptions do |t|
  	t.remove :first_delivery_date
  end
  end
end
