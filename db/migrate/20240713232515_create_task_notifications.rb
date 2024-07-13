class CreateTaskNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :task_notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
