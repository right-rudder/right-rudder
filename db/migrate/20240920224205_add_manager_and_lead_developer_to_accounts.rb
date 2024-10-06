class AddManagerAndLeadDeveloperToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :account_manager_id, :integer
    add_column :accounts, :lead_developer_id, :integer
  end
end
