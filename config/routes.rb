Rails.application.routes.draw do
  #root :to => "/"

  get "/" => "home#index"

  resources :todos

  resources :users

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
