Muncheried::Application.routes.draw do

  root 'meals#index'

  # static routes
  get '/about', to: 'static#about'
  get '/faq',   to: 'static#faq'

  # user routes
  get '/manage', to: 'users#manage'

end
