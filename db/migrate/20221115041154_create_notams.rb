class CreateNotams < ActiveRecord::Migration[7.0]
  def change
    create_table :notams do |t|
      t.string :title
      t.date :notam_date
      t.string :author
      t.text :notam_body

      t.timestamps
    end
  end
end
