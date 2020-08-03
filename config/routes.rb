Rails.application.routes.draw do
  root 'sessions#new'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/quick_login', to: 'sessions#quick_login'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: %i[index new create show destroy] do
    resources :articles, only: %i[new create show] do
      resources :votes, only: [:create]
    end
  end
  resources :categories, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
