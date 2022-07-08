Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "generator#index"
  get "/generator", to: "generator#index"
  get "/generator/new", to:"generator#new"
  post "link", to: "generator#create"
  resources :generator
end
