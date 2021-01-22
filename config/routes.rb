Rails.application.routes.draw do
  resources :votes
  root 'welcome#index'
  
  resources :users
  resources :sessions, only: [:new, :create]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'


end
