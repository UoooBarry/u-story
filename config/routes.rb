Rails.application.routes.draw do
  root 'home#index'

  resources :session, only: [:show]
  resources :categories
end
