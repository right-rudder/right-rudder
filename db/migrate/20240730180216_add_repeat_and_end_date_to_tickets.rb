class AddRepeatAndEndDateToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :repeat, :integer, default: 0
    add_column :tickets, :repeat_until, :date, default: nil
  end
end
