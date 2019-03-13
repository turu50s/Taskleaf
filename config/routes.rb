Rails.application.routes.draw do
  # get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    # get 'users/new'
    # get 'users/edit'
    # get 'users/show'
    # get 'users/index'
    resources :users
  end

  # get 'tasks/index'
  # get 'tasks/show'
  # get 'tasks/new'
  # get 'tasks/edit'
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'tasks#index'
end
