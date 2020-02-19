Rails.application.routes.draw do
  root "airlines#index"

  # users routes
  get '/account' => 'users#index'
  get '/login', to: 'users#login'
  post '/login', to: 'users#loggedin'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/logout', to: 'users#destroy'

  resources :airlines, only: [:index, :show] do 
   resources :flights, only: [:index, :show]
end
  resources :passengers, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :tickets, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
