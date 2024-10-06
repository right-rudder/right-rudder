class AddSpecificBusinessInformationToOnboarding < ActiveRecord::Migration[7.1]
  def change
    add_column :onboardings, :specific_business_information, :jsonb, default: {}
  end
end
