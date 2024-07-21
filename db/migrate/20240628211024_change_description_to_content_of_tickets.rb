class ChangeDescriptionToContentOfTickets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :description, :string
    add_column :tickets, :content, :text
  end
end
