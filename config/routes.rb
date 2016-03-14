Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  resources :users 
end
