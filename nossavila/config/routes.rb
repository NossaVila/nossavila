Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :services
  resources :users
  root 'services#index'
  
end
