Rails.application.routes.draw do
  root 'users#index'
  get '/signup', to: 'users#new'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: %i[index new create show destroy] do
    resources :articles do
      resources :votes, only: [:create]
    end
  end
  resources :categories, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
