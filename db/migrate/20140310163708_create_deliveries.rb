class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :user_id
      t.string :subscription_id
      t.date :expected_date
      t.boolean :delivered
      t.text :notes

      t.timestamps
    end
  end
end
