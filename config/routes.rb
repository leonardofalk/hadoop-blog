Rails.application.routes.draw do
  root to: 'home#index'

  get '/second_index', to: 'home#second_index'
end
