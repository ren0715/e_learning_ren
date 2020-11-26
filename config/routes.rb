Rails.application.routes.draw do
  resources :replies
  resources :comments
  resources :activities do
    
    member do
      post 'upvote'
      delete 'downvote'
    end
  end
  namespace :admin do
    get 'users/index'
  end
  resources :relationships
  resources :words

  
  namespace :admin do
    resources :users do
      member do
        patch 'add'
        patch 'remove'
      end
    end
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
    member do
      get 'following'
      get 'followers' 
    end
  end
  root 'pages#home'
  get 'categories/index'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
