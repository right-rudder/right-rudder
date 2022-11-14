class PagesController < ApplicationController
  # "Static" pages


  def home
  end

  def system
  end

  def schedule_call
  end

  def privacy_policy
  end

  def terms_of_service
  end

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
