Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get '/', to: 'static_pages#home'
  
  get     'signin',  to: 'sessions#new'
  post    'signin',  to: 'sessions#create'
  delete  'signout', to: 'sessions#destroy'
  get     'home',    to: 'static_pages#home'
  get     'search',  to: 'jobs#search'
  
  resources :users 
  
  resources :companies, only: [:new, :create] do 
    resources :jobs, only: [:new, :create] 
  end
  
  resources :jobs, only: [:show]
end
