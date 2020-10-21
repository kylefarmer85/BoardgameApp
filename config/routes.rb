Rails.application.routes.draw do
  resources :boardgame_categories
  root 'boardgames#index'
  resources :categories
  resources :user_boardgames
  resources :user_reviews
  resources :boardgames
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to:  'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  put 'user_reviews/:id/like', to: 'user_reviews#like', as: 'like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
