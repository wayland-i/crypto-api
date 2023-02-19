Rails.application.routes.draw do
  resources :leaderboards
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/products', to: 'api#products'
  
  get '/crypto', to: 'api#cmc_api'

  get '/historical', to: 'api#daily'

end
