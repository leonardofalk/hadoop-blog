Rails.application.routes.draw do
  resources :posts
  root to: 'home#index'

  get '/second_index', to: 'home#second_index'
end
