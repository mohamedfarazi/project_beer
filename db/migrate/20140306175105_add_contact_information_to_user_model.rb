class AddContactInformationToUserModel < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :postal_code, :string
    add_column :users, :phone, :string
    add_column :users, :contact_name, :string
    add_column :users, :company_name, :string
  end
end
