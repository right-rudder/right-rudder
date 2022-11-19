class AddCompanyToAgreements < ActiveRecord::Migration[7.0]
  def change
    add_column :agreements, :company, :string
  end
end
