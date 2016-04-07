Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  resources :users 
  get 'root', to: 'users#index'
end
