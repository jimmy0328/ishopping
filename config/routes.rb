Rails.application.routes.draw do

  # API
  namespace :api, defaults: {format: :json} do
      namespace :v1 do
        resources :products
      end
  end

  devise_for :users

  namespace :admin do
    root "home#index"
    resources :products
  end

  root 'home#index'

end
