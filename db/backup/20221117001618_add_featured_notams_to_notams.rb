class AddFeaturedNotamsToNotams < ActiveRecord::Migration[7.0]
  def change
    add_reference :notams, :featured_notams, null: false, foreign_key: true
  end
end
