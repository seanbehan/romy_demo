Rails.application.routes.draw do
  resources :transactions

  get '/overview' => 'transactions#index'
  match '/profile' => 'auth#profile', via: [:get, :post]

  match '/login' => 'auth#login', via: [:get, :post]
  match '/join' => 'auth#join', via: [:get, :post]
  delete '/logout' => 'auth#logout'

  root 'auth#join'
end
