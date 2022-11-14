Rails.application.routes.draw do
  root "pages#home"

  ### Static pages routes

  # Menu Pages
  get 'marketing-system', to: 'pages#system'
  get 'schedule-call', to: 'pages#schedule_call'

  # Qualify Quiz
  get 'qualify_quiz', to: "pages#one", as: :quiz_one
  get 'qualify_quiz/two', to: "pages#two", as: :quiz_two
  get 'qualify_quiz/three', to: "pages#three", as: :quiz_three
  get 'qualify_quiz/four', to: "pages#four", as: :quiz_four
  get 'qualify_quiz/qualified', to: "pages#qualified", as: :quiz_qualified
  get 'qualify_quiz/unqualified', to: "pages#unqualified", as: :quiz_unqualified


  # Offering Pages / Services
  get 'website-design', to: 'pages#website_design'
  get 'search-engine-optimization', to: 'pages#search_engine_optimization'
  get 'pay-per-click-ads', to: 'pages#pay_per_click_ads'
  get 'video-creation', to: 'pages#video_creation'
  get 'email-campaigns', to: 'pages#email_campaigns'
  get 'social-media-management', to: 'pages#social_media_management'
  get 'reputation-management', to: 'pages#reputation_management'

  # Legal Footer Pages
  get 'privacy-policy', to: 'pages#privacy_policy'
  get 'terms-of-service', to: 'pages#terms_of_service'

end
