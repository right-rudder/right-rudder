# Preview all emails at http://localhost:3000/rails/mailers/news_letter_mailer
class NewsLetterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/news_letter_mailer/news_letter
  def news_letter
    newsletter = NewsletterEmail.last
    NewsLetterMailer.news_letter(newsletter.email, newsletter.name)
  end

end
