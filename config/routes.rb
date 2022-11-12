Rails.application.routes.draw do
  root "pages#home"

  get 'our-system', to: 'pages#system'
  get 'schedule-booking', to: 'pages#schedule_booking'
end
