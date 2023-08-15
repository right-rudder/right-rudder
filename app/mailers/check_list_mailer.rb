class CheckListMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.check_list_mailer.check_list.subject
  #
  def check_list(email, name)
    @name = name

    mail(to: email, bcc: ["no-reply@rightrudder.marketing", "info@rightruddermarketing.com"], subject: "✈️ Flight School Marketing Checklist")
  end
end
