class AddAreaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :area, :boolean
  end
end
