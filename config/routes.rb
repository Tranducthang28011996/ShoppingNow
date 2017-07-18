Rails.application.routes.draw do
  root 'home#index'
  resources :product, only: [:index, :show]
  resources :order, only: [:show]
  resources :order_item, only: [:create, :update, :destroy]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do 
    resources :categories
    resources :products, only: [:edit, :update, :show]
    root 'categories#index'
  end
end
