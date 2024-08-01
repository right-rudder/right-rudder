class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
