Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

root 'pages#home'

# pages
get 'about', to: 'pages#about'

# sessions
get '/login', to: 'sessions#new'
post 'login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

# users
resources :users

end