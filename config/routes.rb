Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "generator#index"
  get "/generator", to: "generator#index"
  get "/generator/new", to:"generator#new"
  get "/generator/id", to:"generator#show"
  post "link", to: "generator#create"
  get ":id", to: "generator#redirect"
  resources :generator
end
