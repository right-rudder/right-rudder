require 'google_drive'
include NewsletterEmailsHelper

class NewsletterEmail < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email

  after_create :update_google_sheet

  private

  def update_google_sheet
    create_json_credentials("config/googleconfig.json")
    session = GoogleDrive::Session.from_service_account_key("config/googleconfig.json")

    spreadsheet = session.spreadsheet_by_key("1-KvGu8x8Lqqsj7DhKPLhUPXWqFbcyUHYodhs0KdsZkw").worksheets[0]
    
    # Write the data from the new instance of the newsletter_emails model
    spreadsheet.insert_rows(spreadsheet.num_rows + 1, [[self.name, self.email, "Newsletter Sign Up", self.created_at]])

    # Save the changes to the Google Sheet
    spreadsheet.save

    delete_file("config/googleconfig.json")
  end

end
