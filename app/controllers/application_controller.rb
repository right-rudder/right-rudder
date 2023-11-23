class ApplicationController < ActionController::Base
  before_action :initialize_newsletter
  invisible_captcha only: [:initialize_newsletter], honeypot: :confirm_email

  private

  # b/c newsletter sign up is on every page...
  def initialize_newsletter
    @newsletter_email = NewsletterEmail.new
  end
end
