class KeywordMailer < ApplicationMailer
  def keyword(email, name)
    @name = name

    mail(to: email, bcc: ["no-reply@rightrudder.marketing", "info@rightruddermarketing.com"], subject: "✈️ Flight School Keywords")
  end
end
