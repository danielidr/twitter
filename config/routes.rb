Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  get 'hashtags/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets
  resources :likes, only: [:new, :create, :destroy]
  resources :friends, only: [:new, :create, :destroy]
  devise_for :users, controllers: { registrations: 'users/registrations'}

  namespace :api do
    namespace :v1 do
      get 'news', to: 'twitter#news'
    end
  end
end
