class PagesController < ApplicationController
  # "Static" pages

  def home
  end

  def system
  end

  def schedule_call
  end

  def about_us
  end

  # Qualify Quiz
  # Questions
  def one
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
    render 'pages/services/website_design'
  end

  def search_engine_optimization
    render 'pages/services/search_engine_optimization'
  end

  def pay_per_click_ads
    render 'pages/services/pay_per_click_ads'
  end

  def video_creation
    render 'pages/services/video_creation'
  end

  def email_campaigns
    render 'pages/services/email_campaigns'
  end

  def social_media_management
    render 'pages/services/social_media_management'
  end

  def reputation_management
    render 'pages/services/reputation_management'
  end

end
