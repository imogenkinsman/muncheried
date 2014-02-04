Muncheried::Application.routes.draw do

  root 'static#sales'

  get '/about', to: 'static#about'
  get '/faq',   to: 'static#faq'

  get '/manage', to: 'users#manage'

end
