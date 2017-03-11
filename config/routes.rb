Rails.application.routes.draw do


  resource :cart, only: [:show,:update,:destroy,:create]
  resources :order_items, only: [:create, :update, :destroy]

  devise_for :users

  root 'static_pages#index'

  get '/store', to: 'products#index'
  get '/product.:id', to: 'products#show'
  post '/product', to: 'products#create'
  get '/product/new', to: 'products#new'
  get '/product/:id/edit', to: 'products#edit'
  patch '/product/:id', to: 'products#update'
  put '/product/:id', to: 'products#update'
  delete '/product/:id', to: 'products#destroy'

  get '/about', to: 'static_pages#about'

  get '/customercare', to: 'static_pages#customer_care'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
