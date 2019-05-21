Rails.application.routes.draw do
  root to: 'static_pages#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/about', to: 'static_pages#about'

  post 'users/new', to: 'users#create'

  resources :users, only: [:new, :create, :destroy, :show, :edit, :update]
  resources :emotions, only: [:index, :new, :destroy, :create]
end
