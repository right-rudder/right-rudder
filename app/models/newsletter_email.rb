require 'google_drive'
include NewsletterEmailsHelper

class NewsletterEmail < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email

  after_create :update_google_sheet

  private

  def update_google_sheet
    path = create_json_credentials("config/googleconfig.json")
    session = GoogleDrive::Session.from_service_account_key(path)
    spreadsheet = session.spreadsheet_by_key("1-KvGu8x8Lqqsj7DhKPLhUPXWqFbcyUHYodhs0KdsZkw").worksheets[0]
    
    # Write the data from the new instance of the newsletter_emails model
    spreadsheet.insert_rows(spreadsheet.num_rows + 1, [[self.email, self.name, self.created_at, "Newsletter Sign Up"]])

    # Save the changes to the Google Sheet
    spreadsheet.save
  end

end
