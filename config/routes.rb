Rails.application.routes.draw do



  # get  '/admins/tetrisadsignin00231', to: 'admin/sessions#new'
  # post '/admins/sign_in', to: 'devise/sessions#create'
  # delete '/admins/sign_out', to: 'devise/sessions#destroy'
  # post  '/admins/password', to:  'devise/passwords#create'
  # get   '/admins/password/new', to: 'devise/passwords#new'
  # get    '/admins/password/edit', to: 'devise/passwords#edit'
  # patch '/admins/password',      to:'devise/passwords#update'
  # put   '/admins/password', to: 'devise/passwords#update'
  # get   '/admins/cancel', to:    'devise/registrations#cancel'
  # post   '/admins', to: 'devise/registrations#create'
  # # get  '/admins/sign_up', to: 'devise/registrations#new', as:'tetrisadsignin00232'
  # get  '/admins/edit', to: 'devise/registrations#edit'
  # patch  '/admins', to: 'devise/registrations#update'
  # put '/admins', to: 'devise/registrations#update'
  # delete '/admins', to: 'devise/registrations#destroy'
  #
  #
  #
  #

  devise_for :admins

  get '/dashboard', to: 'orders#show'

  get 'orders/new', to: 'orders#new'

  get 'orders/destroy', to: 'orders#destroy'

  patch '/delivered', to: 'orders#delivered'

  get '/cart', to: 'carts#show'

  get '/cart', to: 'carts#create'

  patch '/order_item/:id', to: 'cart#update'

  delete '/order_item/:id', to: 'cart#destroy'

  get '/checkout', to: 'orders#checkout'

  resource :cart, only: [ :create]
  resources :order_items, only: [:show,:create, :update, :destroy]
  resources :order_items, only: [:create]
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
