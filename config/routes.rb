Muncheried::Application.routes.draw do

  root 'static#sales'

  get '/about', to: 'static#about'

  get '/signup', to: 'users#signup'

end
