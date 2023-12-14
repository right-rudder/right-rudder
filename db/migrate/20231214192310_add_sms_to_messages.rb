class AddSmsToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :sms, :boolean
  end
end
