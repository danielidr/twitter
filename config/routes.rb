Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets
  resources :likes, only: [:new, :create, :destroy]
  resources :friends, only: [:new, :create, :destroy]
  devise_for :users, controllers: { registrations: 'users/registrations'}
  get 'home/index'
  root to: 'home#index'
end
