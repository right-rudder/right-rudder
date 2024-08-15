class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@rightrudder.marketing"
  layout "mailer"
  if Rails.env.production?
    default_url_options[:host] = "rightruddermarketing.com"
  else
    default_url_options[:host] = "127.0.0.1:3000"
  end
end
