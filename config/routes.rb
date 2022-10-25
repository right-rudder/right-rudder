Rails.application.routes.draw do
  root "pages#home"

  get 'our-system', to: 'pages#system'
end
