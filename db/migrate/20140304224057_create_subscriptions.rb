class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
    	t.references :user
    	t.references :plan
    	t.datetime :first_delivery_date

      t.timestamps
    end
  end
end