Rails.application.routes.draw do
  get 'carts/index'
  get 'carts/show'
  devise_for :users
  get 'homes/index'
  # root "home#index"
  root "products#index"
  resources :products do
    member do 
      post 'buy_now'
      post 'add_now'
    end    
  end
  resources :carts, only:[:index,:show] do 
    member do
      get :new_item
      get 'carts/index',to: 'carts#index'
    end
  end

  post :remove_one, to: 'carts#remove_one'
  post :add_more, to: 'carts#add_more'
  post :add_to_cart, to: 'carts#add_to_cart'
  post :remove_from_cart, to: 'carts#remove_from_cart'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
