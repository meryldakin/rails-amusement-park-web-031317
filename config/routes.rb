Rails.application.routes.draw do

  # Sessions
  # get '/', to: 'sessions#index', as: :home
  root to: 'sessions#index'
  get '/signin', to: 'sessions#new', as: :signin
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'



  # users
  get '/users/new', to: 'users#new', as: :signup
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: :profile
  patch '/users/:id/edit', to: 'users#edit'

  # Attractions
  get '/attractions', to: 'attractions#index', as: :attractions
  get '/attractions/new', to: 'attractions#new', as: :new_attraction
  post '/attractions', to: 'attractions#create'
  get '/attractions/:id', to: 'attractions#show', as: :attraction
  get '/attractions/:id/edit', to: 'attractions#edit', as: :edit_attraction
  patch '/attractions/:id', to: 'attractions#update', as: :update_attraction


end
