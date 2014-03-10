class AddAmountInCentsToPlans < ActiveRecord::Migration
  def change
  add_column :plans, :amount_in_cents, :integer
  end
end
