class AddNPacksToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :n_packs, :integer
  end
end
