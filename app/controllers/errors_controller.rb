class ErrorsController < ApplicationController
  def not_found
    @newsletter_email = NewsletterEmail.new
    render status: 404
  end

  def internal_server_error
    @newsletter_email = NewsletterEmail.new
    render status: 500
  end
end
