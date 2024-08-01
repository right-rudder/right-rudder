class RemoveContentFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :content, :text
  end
end
