Rails.application.routes.draw do
  resources :auditverifications
  resources :tallyverifications
  resources :votes
  root 'welcome#index'
  
  resources :users
  resources :sessions, only: [:new, :create]
  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/sessions', to: 'sessions#create', as: 'session'

  get '/download', to: 'votes#download', as: 'download'


end
