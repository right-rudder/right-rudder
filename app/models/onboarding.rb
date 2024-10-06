class Onboarding < ApplicationRecord
  belongs_to :account
  validates :account_id, uniqueness: true

  store_accessor :primary_contact_information, :first_name, :last_name, :phone, :email
  store_accessor :specific_business_information, :business_name, :industry, :business_size
end
