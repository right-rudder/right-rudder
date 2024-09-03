class AddTypeToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :variant, :integer, default: 0
  end
end
