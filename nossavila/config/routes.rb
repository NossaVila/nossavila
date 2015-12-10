Rails.application.routes.draw do
  
  devise_for :users
  resources :users
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  # }
  resources :additional_informations
  resources :categories
  resources :services
  resources :companies
  resources :home
  root 'home#index'
end
