Rails.application.routes.draw do
  resources :tweets
  resources :likes, only: [:new, :create, :destroy]
  resources :friends, only: [:new, :create, :destroy]
  devise_for :users, controllers: { registrations: 'users/registrations'}
  get 'home/index'
  root to: 'home#index'
end
