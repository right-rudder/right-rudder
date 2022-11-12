Rails.application.routes.draw do
  root "pages#home"

  # Static pages routes
  get 'marketing-system', to: 'pages#system'
  get 'schedule-call', to: 'pages#schedule_call'
  get 'privacy-policy', to: 'pages#privacy_policy'
  get 'terms-of-service', to: 'pages#terms_of_service'



end
