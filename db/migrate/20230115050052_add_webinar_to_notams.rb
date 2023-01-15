class AddWebinarToNotams < ActiveRecord::Migration[7.0]
  def change
    add_column :notams, :webinar, :string
  end
end
