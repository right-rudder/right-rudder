class CreateFeaturedNotams < ActiveRecord::Migration[7.0]
  def change
    create_table :featured_notams do |t|
      t.string :notam

      t.timestamps
    end
  end
end
