class RemoveNotamsFromFeaturedNotams < ActiveRecord::Migration[7.0]
  def change
    remove_column :featured_notams, :notam, :string
  end
end
