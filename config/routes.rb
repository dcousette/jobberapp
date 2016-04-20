Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get '/', to: 'sessions#new'
  
  get     'signin', to: 'sessions#new'
  post    'signin', to: 'sessions#create'
  delete  'signout', to: 'sessions#destroy'
  
  resources :users 
  
  resources :companies, only: [:new, :create] do 
    resources :jobs 
  end 
end
