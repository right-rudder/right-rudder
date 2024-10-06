Rails.application.routes.draw do
  get '/sitemap.xml.gz', to: redirect("https://rrmsitemaps.s3.us-east-2.amazonaws.com/sitemap.xml.gz")

  # 404/500 pages
  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions", invitations: 'invitations' }

  root to: 'customer_portal#index'

  authenticated :user do
    resources :users, only: [:index]
    resource :profile_image, only: [:destroy]
    resources :accounts do
      post :invite_user, on: :member
      get 'users', to: 'accounts#users', as: :users
      resources :onboardings
      resource :logo, only: [:destroy]
      resources :tickets do
        member do
          patch :update_completed
        end
        resources :comments
        resources :ticket_subscriptions, only: [:create, :destroy]
      end
    end
    resources :tickets, only: [:index], controller: 'customer_portal/tickets'
  end

  get 'locations/states', to: 'locations#states'
  get 'locations/cities', to: 'locations#cities'
end
