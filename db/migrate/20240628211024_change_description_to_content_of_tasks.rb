class ChangeDescriptionToContentOfTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :description, :string
    add_column :tasks, :content, :text
  end
end
