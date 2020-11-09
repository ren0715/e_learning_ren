Rails.application.routes.draw do
  resources:sessions
  resources:users
  root 'pages#home'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
