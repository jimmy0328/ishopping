Rails.application.routes.draw do

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
  end

  resources :products, param: :permalink do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      post :checkout
    end
  end

  resources :orders

end
