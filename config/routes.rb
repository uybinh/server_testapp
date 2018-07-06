Rails.application.routes.draw do
  get 'sessions/new'
  root "users#index"
end