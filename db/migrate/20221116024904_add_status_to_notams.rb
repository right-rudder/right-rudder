class AddStatusToNotams < ActiveRecord::Migration[7.0]
  def change
    add_column :notams, :status, :string
  end
end
