class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
