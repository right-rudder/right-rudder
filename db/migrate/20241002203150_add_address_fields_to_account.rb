class AddAddressFieldsToAccount < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :address_line_1, :string
    add_column :accounts, :address_line_2, :string
    add_column :accounts, :city, :string
    add_column :accounts, :state, :string
    add_column :accounts, :zip, :string
    add_column :accounts, :country, :string
  end
end
