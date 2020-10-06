Rails.application.routes.draw do
  resources :users, only: [:edit, :update]
  resources :products
  get '/sign_in', to:'users#sign_in', as: :sign_in
  post '/sign_in', to: 'users#sign_in_process'
  get '/users/new', to:'users#new', as: :new
  post '/users/new', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
