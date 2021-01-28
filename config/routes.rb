Rails.application.routes.draw do
  get 'sessions/new'
  
  root 'pages#index'
  
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :topics
  
  get 'favorites/index', to: 'favorites#index'
  post '/favorites', to: 'favorites#create'
end
