Rails.application.routes.draw do
  
  
  resources :servicelogs
  resources :fuellogs
  resources :autos
  resources :users
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  
  get "/admin", to: 'admin#index', as: 'admin'
  get "/about", to: 'home#about', as: 'about'
  
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
