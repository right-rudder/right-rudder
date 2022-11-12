Rails.application.routes.draw do
  root "pages#home"

  get 'marketing-system', to: 'pages#system'
  get 'schedule-call', to: 'pages#schedule_call'
end
