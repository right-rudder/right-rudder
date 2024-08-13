class CreateTicketSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :ticket_subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end

    add_index :ticket_subscriptions, [:user_id, :ticket_id], unique: true
  end
end
