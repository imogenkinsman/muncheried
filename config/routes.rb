Muncheried::Application.routes.draw do

  root 'meals#index'

  # static routes
  get '/about', to: 'static#about'
  get '/faq',   to: 'static#faq'

  # user routes
  resources :users, only: [:new, :create, :destroy]

end
