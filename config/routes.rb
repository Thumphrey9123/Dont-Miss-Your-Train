Rails.application.routes.draw do
  root "sessions#welcome"
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome', as: 'welcome'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  get '/home', to: 'users#home', as: "home"
  # get '/delete/favorite', to: 'favorites#destroy', as: 'delete_favorite'

  resources :stations, :trains, only: [:show, :index]
  resources :favorites, :arrivals
  resources :users, except: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
