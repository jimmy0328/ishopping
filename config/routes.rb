require 'sidekiq/web'
Rails.application.routes.draw do

  mount Sidekiq::Web, at: '/sidekiq'
  # API
  namespace :api, defaults: {format: :json} do
      namespace :v1 do
        resources :products
      end
  end

  root 'home#index'
  devise_for :users

  namespace :admin do
    root "home#index", as: 'root'
    resources :products
    resources :orders, only: [:index]
    resources :users, only: [:index, :show, :update, :edit]
  end

  resources :products, param: :permalink do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      post :checkout
      delete :clean
    end
  end

  resources :orders
  resources :items, only: [:update, :destroy], controller: "cart_items"

end
