# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  def new_message
    message = Message.last
    MessageMailer.message_email(message)
  end
end
