Muncheried::Application.routes.draw do

  root 'meals#index'

  # static routes
  get '/about', to: 'static#about'
  get '/faq',   to: 'static#faq'

  # user routes
  resources :users, only: :create
  get '/users/:id/unsubscribe/:key', to: 'users#unsubscribe', as: 'unsubscribe'

end
