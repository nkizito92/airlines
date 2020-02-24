Rails.application.routes.draw do
  root "airlines#index"

  get 'auth/:provider/callback' => 'sessions#create' 

  # users routes
  #admin user
  get '/account' => 'users#index'
  # regular users
  get '/login', to: 'users#login'
  post '/login', to: 'users#loggedin'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/logout', to: 'users#destroy'

  # tickets

  get '/tickets/cheapest', to: 'tickets#cheapest', as: 'cheapest'
  get '/tickets/expensive', to: 'tickets#expensive', as: 'expensive'
  get '/tickets/:id/buy', to: 'tickets#edit', as: 'buy_ticket'

  resources :airlines, only: [:index, :show] do 
   resources :flights, only: [:index, :show]
end

resources :flights, only: [:show] do 
  resources :tickets, only: [:new, :create]
end
resources :tickets, only: [:index, :show, :new, :create, :update, :destroy]

resources :passengers, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
