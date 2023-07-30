class Message < ApplicationRecord
  before_validation :strip_phone_number

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validate :content_presence


  def strip_phone_number
    self.phone = phone.to_s.gsub(/[-() ]/, "")
  end

  private
  
  # Custom Error message.  It removes the model name from the error message
  def content_presence
    errors.add(:base, "Your message can't be blank") if content.blank?
  end

end
