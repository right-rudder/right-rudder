class MessageMailer < ApplicationMailer
  default from: 'no-reply@rightrudder.marketing'

  def message_email(message)
    @message = message

    mail(to: @message.email, bcc: ["no-reply@rightrudder.marketing", "info@rightruddermarketing.com"], subject: "✈️ Thanks for Contacting Right Rudder")
  end

end
