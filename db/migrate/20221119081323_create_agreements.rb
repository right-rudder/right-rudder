class CreateAgreements < ActiveRecord::Migration[7.0]
  def change
    create_table :agreements do |t|
      t.string :name
      t.date :sign_date

      t.timestamps
    end
  end
end
