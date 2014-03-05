class AddFirstDeliveryDateToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :first_delivery_date, :date
  end
end
