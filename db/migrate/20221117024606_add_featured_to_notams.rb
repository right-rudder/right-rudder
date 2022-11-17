class AddFeaturedToNotams < ActiveRecord::Migration[7.0]
  def change
    add_column :notams, :featured, :string
  end
end
