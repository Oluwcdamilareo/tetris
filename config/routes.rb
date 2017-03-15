Rails.application.routes.draw do


  devise_for :admins
  get 'orders/show'

  get 'orders/create'

  get 'orders/new'

  get 'orders/destroy'

  resource :cart, only: [:show,:update,:destroy,:create]
  resources :order_items, only: [:show,:create, :update, :destroy]
  devise_for :users

  root 'static_pages#index'

  get '/store', to: 'products#index'
  get '/product/new', to: 'products#new'
  get '/product/:id', to: 'products#show', as: 'product'
  post '/product', to: 'products#create'
  get '/product/:id/edit', to: 'products#edit', as:'product_edit'
  patch '/product/:id', to: 'products#update'
  put '/product/:id', to: 'products#update'
  delete '/product/:id', to: 'products#destroy'

  get '/about', to: 'static_pages#about'

  get '/customercare', to: 'static_pages#customer_care'

  get '/account', to: 'static_pages#account'

  get '/admin', to: 'admins#admin_account', as: 'addacc'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
