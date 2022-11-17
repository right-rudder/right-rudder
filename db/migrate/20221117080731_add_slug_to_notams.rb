class AddSlugToNotams < ActiveRecord::Migration[7.0]
  def change
    add_column :notams, :slug, :string
    add_index :notams, :slug, unique: true
  end
end
