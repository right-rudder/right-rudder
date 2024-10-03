class Onboarding < ApplicationRecord
  belongs_to :account
  validates :account_id, uniqueness: true

  store_accessor :primary_contact_information, :first_name, :last_name, :phone, :email
end
