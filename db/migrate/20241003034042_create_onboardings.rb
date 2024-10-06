class CreateOnboardings < ActiveRecord::Migration[7.1]
  def change
    create_table :onboardings do |t|
      t.references :account, null: false, foreign_key: true
      t.jsonb :primary_contact_information, default: {}

      t.timestamps
    end
  end
end
