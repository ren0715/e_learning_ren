Rails.application.routes.draw do
  
  
  resources :words
  namespace :admin do
    resources :users
    resources :categories do
      resources :words
    end
  end
  
  resources :categories
  
  resources :lessons do
    resources :answers
  end
  resources :sessions
  resources :users do
    get 'dashboard'
  end
  root 'pages#home'
  get 'categories/index'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
