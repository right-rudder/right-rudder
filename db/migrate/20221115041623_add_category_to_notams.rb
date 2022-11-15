class AddCategoryToNotams < ActiveRecord::Migration[7.0]
  def change
    add_column :notams, :category, :string
  end
end
