Rails.application.routes.draw do
  get '/sitemap.xml.gz', to: redirect("https://rrmsitemaps.s3.us-east-2.amazonaws.com/sitemap.xml.gz")

  # 404/500 pages
  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get 'contact-us-confirmation', to: "messages#confirm", as: :message_confirm
  get 'contact-us', to: "messages#new", as: :contact
  resources :messages


  # Newsletters
  get 'newsletter_confirm', to: "newsletter_emails#confirm", as: :newsletter_confirm
  resources :newsletter_emails

  # Careers
  #get 'careers/web_developer', to: "careers#webdeveloper", as: :webdeveloper
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
  post 'uploader/image', to: 'uploader#image' #add upload image to notams
  get 'notams/business-and-marketing', to: 'notams#bm', as: :bm
  get 'notams/aviation-and-flying', to: 'notams#af', as: :af
  get 'notams/news-and-annoucements', to: 'notams#na', as: :na
  get 'notams/flight-school-blog-posts', to: 'notams#fs', as: :fs
  get 'notams/all', to: 'notams#all', as: :all
  get 'notams/drafts', to: 'notams#draft', as: :draft

  # Webinars
  # resources :webinars  #no model
  get 'webinar-registration-confirmation', to: "notams#webinar_confirmation"
  get 'webinars', to: 'notams#webinars'
  resources :notams #webinars are a part of notams right now..

  # Agreement
  #get 'agreements/form2', to: 'agreements#form2', as: :form2
  #resources :agreements

  ### Static pages routes

  ### FUNNELS ###
  # GROWTH ACCELERATOR SESSION
  get 'schedule-call', to: 'pages#schedule_call', as: :schedule_call
  #get 'schedule-call-confirmation', to: 'pages#schedule_call_confirmation'

  get 'flight-school-marketing-checklist', to: 'pages#checklist', as: "checklist"
  # Checklist dl page
  get 'checklist_confirm', to: "checklist_emails#confirm", as: :checklist_confirm
  resources :checklist_emails

  # SOP
  get 'flight-school-sop-template', to: 'pages#sop', as: "sop"
  # SOP dl page
  get 'sop_confirm', to: "sop_emails#confirm", as: :sop_confirm
  resources :sop_emails

  # Google My Business
  get 'flight-school-google-my-business', to: 'pages#gmb_email', as: "gmb_email"
  # GMB dl page
  get 'gmb_confirm', to: "gmb_emails#confirm", as: :gmb_confirm
  resources :gmb_emails


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
  get 'our-services', to: 'pages#services'
  get 'how-it-works', to: 'pages#how_it_works'
  get 'resources', to: 'pages#resources'
  get 'about', to: 'pages#about'
  #get 'system-video', to: 'pages#system_video'
  get 'about-us', to: 'pages#about_us'  #Leave link due to Google previously knowing about this page
  get 'our-team', to: 'pages#about_us', as: :our_team
  get 'partners-affiliates-sponsors', to: 'pages#partners', as: :partners
  get 'mission-and-vision', to: 'pages#mission', as: :mission
  get 'core-values', to: 'pages#core', as: :core
  get 'investors', to: 'pages#investors', as: :investors

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

  # Temporary FSCRM TOS
  get 'flight-school-crm-terms-of-service-privacy-policy', to: 'pages#tos_fscrm'

  #
  get 'pre-meeting-questionnaire', to: 'pages#pre-meeting-questionnaire'

end
