class AddMetaDescriptionToNotams < ActiveRecord::Migration[7.0]
  def change
    add_column :notams, :meta_description, :string
    add_column :notams, :meta_keywords, :string
    add_column :notams, :tags, :string
  end
end
