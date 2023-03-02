class CreateChecklistEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :checklist_emails do |t|
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
