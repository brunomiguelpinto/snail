Rails.application.routes.draw do
  resource :session
  resource :registration, only: [ :new, :create ]
  resources :passwords, param: :token

  get  "login",    to: "sessions#new",       as: :login
  post "login",    to: "sessions#create"
  delete "logout", to: "sessions#destroy",   as: :logout

  get  "signup", to: "registrations#new", as: :signup
  post "signup", to: "registrations#create"

  get "perks", to: "pages#perks", as: :perks
  get "demo",  to: "pages#members_demo", as: :demo

  get "members", to: "members#index", as: :members

  root "pages#landing"

  get "up" => "rails/health#show", as: :rails_health_check
end
