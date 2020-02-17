Rails.application.routes.draw do
  resources :users
  resources :flights
  resources :passengers
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
