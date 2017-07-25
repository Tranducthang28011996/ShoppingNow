Rails.application.routes.draw do
  resources :reviews, only: [:index, :show, :new, :create]

  scope "(:locale)", locale: /en|vi/ do
  resources :payment, only: [:index, :show]
  root 'home#index'
  resources :product, only: [:index, :show]
  resources :order, only: [:show, :destroy]
  resources :category
  # resources :order_item, only: [:create, :update, :destroy]
  resources :order_item
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  namespace :admin do 
    resources :categories
    resources :products, only: [:edit, :update, :show, :destroy]
    root 'categories#index'
  end
end
