Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#index'

  get '/store', to: 'static_pages#store'

  get '/about', to: 'static_pages#about'

  get '/customercare', to: 'static_pages#customer_care'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
