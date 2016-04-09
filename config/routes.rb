Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  resources :users 
  get 'root', to: 'users#index'
  
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  resources :companies, only: [:new, :create]
end
