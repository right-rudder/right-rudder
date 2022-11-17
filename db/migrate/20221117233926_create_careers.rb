class CreateCareers < ActiveRecord::Migration[7.0]
  def change
    create_table :careers do |t|
      t.string :role
      t.string :location
      t.date :post_date

      t.timestamps
    end
  end
end
