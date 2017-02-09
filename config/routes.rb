Rails.application.routes.draw do
  
  resources :autos
  resources :users
  get "/about", to: 'home#about', as: 'about'
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
