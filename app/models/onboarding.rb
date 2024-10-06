class Onboarding < ApplicationRecord
  belongs_to :account
  validates :account_id, uniqueness: true

  store_accessor :primary_contact_information, :name, :email, :phone, :home_address
  store_accessor :specific_business_information, :hours_of_operation, :creation_date, :business_type, :core_values, :number_of_locations, :primary_service_areas, :secondary_service_areas, :number_of_employees, :summary_of_history, :unique_selling_proposition, :unique_training_programs_proposition
end
