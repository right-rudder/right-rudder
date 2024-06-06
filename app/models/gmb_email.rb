require 'google_drive'
include NewsletterEmailsHelper

class GmbEmail < ApplicationRecord
  before_validation :strip_phone_number
  after_create :to_ghl

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  validates_uniqueness_of :email

  # after_create :update_google_sheet

  def strip_phone_number
    self.phone = phone.to_s.gsub(/[-() ]/, "")
  end

  def to_ghl
    ghl_url = ENV['ghl_gmb']
    ghl_payload = {
      "name" => "#{self.name}",
      "email" => "#{self.email}",
      "phone" => "#{self.phone}",
    }
    HTTParty.post(ghl_url, body: ghl_payload.to_json, headers: { "Content-Type" => "application/json" })
  end

  private

  def update_google_sheet
    create_json_credentials("config/googleconfig.json")
    session = GoogleDrive::Session.from_service_account_key("config/googleconfig.json")

    spreadsheet = session.spreadsheet_by_key("1-KvGu8x8Lqqsj7DhKPLhUPXWqFbcyUHYodhs0KdsZkw").worksheets[0]

    # Write the data from the new instance of the newsletter_emails model
    spreadsheet.insert_rows(spreadsheet.num_rows + 1, [[self.name, self.email, self.phone, "GMB Sign Up", self.created_at]])

    # Save the changes to the Google Sheet
    spreadsheet.save

    delete_file("config/googleconfig.json")
  end
end
