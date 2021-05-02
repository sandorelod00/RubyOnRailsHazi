Rails.application.routes.draw do
  get 'feedback/new'
  get 'feedback/create'
  root 'users#new'
  resources :teams
  post '/sessions/create', to: 'sessions#create', as: 'login'
  get '/sessions/destroy', to: 'sessions#destroy', as: 'logout'
  get 'users/new', to: 'users#new', as: 'register'
  post 'users/create'
  get 'users/edit/:id', to: 'users#edit', as: 'edit_profile'
  post 'users/update/:id', to: 'users#update', as: 'update_profile'
  get 'users/show/:id', to: 'users#show', as: 'profile'
  get 'users/forgotten'
  post 'users/send_forgotten'
  resources :projects
  get 'say/hello'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/teams/:id/remove_member/:memberId', to: 'teams#remove_member', as: 'remove_member'
  post '/teams/:id/add_member', to: 'teams#add_member', as: 'add_member'

  get '/feedback/new/:toUserId', to: 'feedback#new', as: "writeFeedBack"
  post '/feedback/create', to: 'feedback#create'

end
