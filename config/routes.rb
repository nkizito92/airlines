Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :airlines, only: [:index, :show] do 
   resources :flights, only: [:index, :show]
end
  resources :passengers, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :tickets, only: [:show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
