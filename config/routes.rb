Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  resources :users 
  get '/', to: 'sessions#new'
  
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  resources :companies, only: [:new, :create]
end
