class CreateWebinars < ActiveRecord::Migration[7.0]
  def change
    create_table :webinars do |t|
      t.string :title
      t.string :host
      t.date :webinar_date
      t.string :meta_description
      t.string :meta_keywords

      t.timestamps
    end
  end
end
