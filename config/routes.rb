Rails.application.routes.draw do
  
  # 404/500 pages
  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  resources :newsletter_emails
  resources :careers
  devise_scope :admin do
    # Redirests signing out users back to sign-in
    get "admins", to: "devise/sessions#new"
  end
  
  devise_for :admins, controllers: { registrations: "registrations", sessions: "sessions" }

  # homepage
  root "pages#home"
  get 'intro_video_embed', to: "pages#intro_video_embed", as: :embed_video
  get 'newsletter_confirm', to: "newsletter_emails#confirm", as: :newsletter_confirm

  # Notams
  get 'notams/select_featured', to: 'notams#select_featured_notams'
  post 'uploader/image', to: 'uploader#image' #add upload image to notams 
  get 'webinars', to: 'notams#webinars'
  resources :notams

  # Webinars
  # resources :webinars
  
  # Agreement
  get 'agreements/form2', to: 'agreements#form2', as: :form2 
  resources :agreements

  ### Static pages routes

  # Menu Pages
  get 'marketing-system', to: 'pages#system'
  get 'schedule-call', to: 'pages#schedule_call'
  get 'about-us', to: 'pages#about_us'
  get 'system-video', to: 'pages#system_video'
  get 'flight-school-marketing-checklist', to: 'pages#checklist', as: "checklist"

  # Qualify Quiz
  get 'qualify_quiz', to: "pages#one", as: :quiz_start
  get 'qualify_quiz/two', to: "pages#two", as: :quiz_question_two
  get 'qualify_quiz/three', to: "pages#three", as: :quiz_question_three
  get 'qualify_quiz/four', to: "pages#four", as: :quiz_question_four
  get 'qualify_quiz/qualified', to: "pages#qualified", as: :quiz_qualified
  get 'qualify_quiz/unqualified_CFI', to: "pages#unqualified_CFI", as: :quiz_unqualified_CFI
  get 'qualify_quiz/unqualified_ad', to: "pages#unqualified_ad", as: :quiz_unqualified_ad
  get 'qualify_quiz/unqualified_capacity', to: "pages#unqualified_capacity", as: :quiz_unqualified_capacity
  get 'qualify_quiz/unqualified_service', to: "pages#unqualified_service", as: :quiz_unqualified_service


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
