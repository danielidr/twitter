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
      get ':date1/:date2', to: 'twitter#by_date'
      post 'new_tweet', to: 'twitter#new_tweet'
    end
  end
end
