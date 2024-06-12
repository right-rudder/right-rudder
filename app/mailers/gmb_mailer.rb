class GmbMailer < ApplicationMailer
  def gmb(email, name)
    @name = name

    mail(to: email, bcc: ["no-reply@rightrudder.marketing", "info@rightruddermarketing.com"], subject: "✈️ Flight School Google Business Profile Optimization Guide")
  end
end
