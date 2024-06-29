class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :task, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
