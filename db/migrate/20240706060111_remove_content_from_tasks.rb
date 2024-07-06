class RemoveContentFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :content, :text
  end
end
