class PagesController < ApplicationController
  # "Static" pages
  # Newsletteremail model really needs to be called lead generator or something like that.. lol

  def home
    @newsletter_email = NewsletterEmail.new
  end

    def intro_video_embed
      render 'intro_video_embed'
    end

  def system
    @newsletter_email = NewsletterEmail.new
  end

  def checklist
    @newsletter_email = NewsletterEmail.new
  end

  def system_video
  end

  def schedule_call
  end

  def about_us
    @newsletter_email = NewsletterEmail.new
  end

  # Qualify Quiz
  # Questions
  def one
    @newsletter_email = NewsletterEmail.new
    render 'pages/qualify_quiz/one'
    
  end
  def two
    render 'pages/qualify_quiz/two'
  end
  def three
    render 'pages/qualify_quiz/three'
  end
  def four
    render 'pages/qualify_quiz/four'
  end

  # Quiz Pass Results
  def qualified
    render 'pages/qualify_quiz/qualified'
  end

  # Quiz fail pages
  def unqualified_CFI
    render 'pages/qualify_quiz/unqualified_CFI'
  end
  def unqualified_ad
    render 'pages/qualify_quiz/unqualified_ad'
  end
  def unqualified_capacity
    render 'pages/qualify_quiz/unqualified_capacity'
  end
  def unqualified_service
    render 'pages/qualify_quiz/unqualified_service'
  end

  # Legal
  def privacy_policy
    render 'pages/legal/privacy_policy'
  end

  def terms_of_service
    render 'pages/legal/terms_of_service'
  end

  # services
  def website_design
    @newsletter_email = NewsletterEmail.new
    render 'pages/services/website_design'
  end

  def search_engine_optimization
    @newsletter_email = NewsletterEmail.new
    render 'pages/services/search_engine_optimization'
  end

  def pay_per_click_ads
    @newsletter_email = NewsletterEmail.new
    render 'pages/services/pay_per_click_ads'
  end

  def video_creation
    @newsletter_email = NewsletterEmail.new
    render 'pages/services/video_creation'
  end

  def email_campaigns
    @newsletter_email = NewsletterEmail.new
    render 'pages/services/email_campaigns'
  end

  def social_media_management
    @newsletter_email = NewsletterEmail.new
    render 'pages/services/social_media_management'
  end

  def reputation_management
    @newsletter_email = NewsletterEmail.new
    render 'pages/services/reputation_management'
  end

end
