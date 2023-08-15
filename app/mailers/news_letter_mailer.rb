class NewsLetterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.news_letter_mailer.news_letter.subject
  #

  def news_letter(email, name)
    @name = name

    mail(to: email, bcc: ["no-reply@rightrudder.marketing", "info@rightruddermarketing.com"], subject: "✈️ Welcome Aboard! Your Exclusive Pass to Exciting Updates and Insights")
  end
end
