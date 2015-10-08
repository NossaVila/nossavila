Rails.application.routes.draw do
  devise_for :users
#  devise_for :users
  resources :categories
  resources :services
  root 'services#index'
end
