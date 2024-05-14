class SopMailer < ApplicationMailer
  def sop(email, name)
    @name = name

    mail(to: email, bcc: ["no-reply@rightrudder.marketing", "info@rightruddermarketing.com"], subject: "✈️ Flight School Marketing SOP")
  end
end
