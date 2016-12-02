Rails.application.routes.draw do
  resources :posts
  resources :word_ranks
  root to: 'home#index'

  get '/second_index', to: 'home#second_index'
end
