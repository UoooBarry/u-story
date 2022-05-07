Rails.application.routes.draw do
  root 'home#index'

  resources :session, only: [:show]
  resources :categories
  resources :articles
  resources :letter, only: [:index] do
    collection do
      get :render_letter
      post :render_letter
    end
  end
  resources :sign_images, only: [:create]
end
