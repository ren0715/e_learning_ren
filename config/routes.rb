Rails.application.routes.draw do
  
  
  namespace :admin do
    resources:users
    resources:categories do
      resources:words
    end
  end
  resources:answers
  resources:categories
  resources:sessions
  resources:users do
    get 'dashboard'
  end
  root 'pages#home'
  get 'categories/index'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
