class RemoveContentFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tickets, :content, :text
  end
end
