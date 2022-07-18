Rails.application.routes.draw do
  resources :users, only: [:new, :create, :reset_session]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "welcome", to: "sessions#welcome"
  root "generator#index"
  get "/generator/new", to:"generator#new"
  get "/generator/:id", to:"generator#show"
  post "link", to: "generator#create"
  get ":short", to: "generator#redirect"
end
