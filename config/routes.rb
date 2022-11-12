Rails.application.routes.draw do
  root "pages#home"

  ### Static pages routes

  # Menu Pages
  get 'marketing-system', to: 'pages#system'
  get 'schedule-call', to: 'pages#schedule_call'

  # Legal Footer Pages
  get 'privacy-policy', to: 'pages#privacy_policy'
  get 'terms-of-service', to: 'pages#terms_of_service'

  # Offering Pages
  get 'website-design', to: 'pages#website_design'
  get 'search-engine-optimization', to: 'pages#search_engine_optimization'
  get 'pay-per-click-ads', to: 'pages#pay_per_click_ads'
  get 'video-creation', to: 'pages#video_creation'
  get 'email-campaigns', to: 'pages#email_campaigns'
  get 'social-media-management', to: 'pages#social_media_management'
  get 'reputation-management', to: 'pages#reputation_management'




end
