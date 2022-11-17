class AddSlugToWebinars < ActiveRecord::Migration[7.0]
  def change
    add_column :webinars, :slug, :string
    add_index :webinars, :slug, unique: true
  end
end
