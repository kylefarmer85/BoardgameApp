Rails.application.routes.draw do
  root 'boardgames#home'
  resources :categories
  resources :user_boardgames
  resources :user_reviews
  resources :boardgames
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
