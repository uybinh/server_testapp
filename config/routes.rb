Rails.application.routes.draw do
  root "users#index"
  resources :users
  get "/login", to: "sessions#new"
end