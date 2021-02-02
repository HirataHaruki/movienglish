Rails.application.routes.draw do
  get 'sessions/new'
  
  root 'pages#index'
  
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :topics do
    resources :comments
  end
  
  get 'favorites/index', to: 'favorites#index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  post '/unfavorites', to: 'unfavorites#create'
  delete '/unfavorites', to: 'unfavorites#destroy'
end
