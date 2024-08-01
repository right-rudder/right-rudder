class AddCompletedToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :completed, :boolean, default: false, null: false
  end
end
