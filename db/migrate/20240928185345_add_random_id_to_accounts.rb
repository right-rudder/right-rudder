class AddRandomIdToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :random_id, :string

    Account.reset_column_information
    Account.find_each do |account|
      account.update_column(:random_id, "#{account.random_id_prefix}_#{SecureRandom.alphanumeric(8).downcase}")
    end

    change_column_null :accounts, :random_id, false
    add_index :accounts, :random_id, unique: true
  end
end
