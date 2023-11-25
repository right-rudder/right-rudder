Rails.application.routes.draw do
  get '/sitemap.xml.gz', to: redirect("https://rrmsitemaps.s3.us-east-2.amazonaws.com/sitemap.xml.gz")
  
  # 404/500 pages
  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get 'message_confirm', to: "messages#confirm", as: :message_confirm
  get 'contact-us', to: "messages#new", as: :contact
  resources :messages

  # Checklist dl page
  get 'checklist_confirm', to: "checklist_emails#confirm", as: :checklist_confirm
  resources :checklist_emails

  # Newsletters
  get 'newsletter_confirm', to: "newsletter_emails#confirm", as: :newsletter_confirm
  resources :newsletter_emails
  
  # Careers
  get 'careers/web_developer', to: "careers#webdeveloper", as: :webdeveloper
  resources :careers
  


  devise_scope :admin do
    # Redirests signing out users back to sign-in
    get "admins", to: "devise/sessions#new"
  end
  
  devise_for :admins, controllers: { registrations: "registrations", sessions: "sessions" }

  # homepage
  root "pages#home"
  get 'intro_video_embed', to: "pages#intro_video_embed", as: :embed_video



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

  # Funnels
  get 'schedule-call', to: 'pages#schedule_call'
  get 'flight-school-marketing-checklist', to: 'pages#checklist', as: "checklist"
  get 'flight-school-hot-aviation-keyword-list', to: 'pages#keyword', as: :keyword

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

  # Menu Pages
  get 'marketing-system', to: 'pages#system'
  #get 'system-video', to: 'pages#system_video'
  get 'about-us', to: 'pages#about_us'  #Leave link due to Google previously knowing about this page
  get 'our-team', to: 'pages#about_us', as: :our_team
  get 'partners-affiliates-sponsors', to: 'pages#partners', as: :partners
  get 'mission-and-vision', to: 'pages#mission', as: :mission

  # Offering Pages / Services
  get 'website-design', to: 'pages#website_design'                              #previous route... #need to delete from GMB account then remove in app
  get 'flight-school-website-design', to: 'pages#website_design', as: :website  #seo optimized "flight school" route
  get 'search-engine-optimization', to: 'pages#search_engine_optimization'      #previous route...
  get 'flight-school-seo', to: 'pages#search_engine_optimization', as: :seo     #seo optimized "flight school" route
  get 'pay-per-click-ads', to: 'pages#pay_per_click_ads'                        #previous route...
  get 'flight-school-advertising-ppc', to: 'pages#pay_per_click_ads', as: :ppc  #seo optimized "flight school" route
  get 'how-to-optimize-google-my-business-2024', to: 'pages#gmb2024', as: :gmb
  get 'how-to-run-effective-facebook-ads-in-2024', to: 'pages#fbads2024', as: :fbads
  get 'how-to-enroll-more-students-with-google-ads-in-2024', to: 'pages#googleads2024', as: :googleads
  get 'video-creation', to: 'pages#video_creation', as: :video_production

  # Legal Footer Pages
  get 'privacy-policy', to: 'pages#privacy_policy'
  get 'terms-of-service', to: 'pages#terms_of_service'

end
