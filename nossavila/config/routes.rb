Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  # }
  resources :categories
  resources :services
  root 'services#index'
end
