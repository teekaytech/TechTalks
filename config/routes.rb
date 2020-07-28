Rails.application.routes.draw do
  root 'sessions#new'
  get '/signup', to: 'users#new'
  resources :users, only: [:index, :new, :create, :show, :destroy]

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
