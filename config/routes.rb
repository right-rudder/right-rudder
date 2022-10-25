Rails.application.routes.draw do
  root "pages#home"

  get 'flight-school-marketing-system', to: 'pages#system'
end
