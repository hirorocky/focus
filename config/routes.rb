Rails.application.routes.draw do
  devise_for :users

  root to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get 'emotions-all', to: 'emotions#index_all'

  resources :emotions, only: [:index, :new, :destroy, :create]
end
