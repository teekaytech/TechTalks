Rails.application.routes.draw do
  root 'users#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/quick_login', to: 'sessions#quick_login'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[index new create show destroy]
  resources :articles, only: %i[new create show] do
    resources :votes, only: [:create]
  end
  resources :categories, only: %i[show index]

  get 'auth/:provider/callback', to: 'sessions#external_auth'
  get 'auth/failure', to: 'sessions#failure'
end
