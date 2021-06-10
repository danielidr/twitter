Rails.application.routes.draw do
  resources :tweets
  resources :likes, only: [:new, :create]
  devise_for :users, controllers: { registrations: 'users/registrations'}
  get 'home/index'
  root to: 'home#index'
end
