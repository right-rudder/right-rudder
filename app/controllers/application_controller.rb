class ApplicationController < ActionController::Base
  before_action :initialize_newsletter
  before_action :configure_permitted_parameters, if: :devise_controller?
  invisible_captcha only: [:initialize_newsletter], honeypot: :confirm_email

  private

  # b/c newsletter sign up is on every page...
  def initialize_newsletter
    @newsletter_email = NewsletterEmail.new
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :profile_image, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :profile_image, :username])
  end
end
