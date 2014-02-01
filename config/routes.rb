Muncheried::Application.routes.draw do

  root 'static#sales'

  get '/about', to: 'static#about'

end
