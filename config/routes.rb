App::Application.routes.draw do
  resources :users

  resources :organizations

  resources :admins, only: [:new, :create, :index, :show]

  resources :sessions, only: [:new, :create, :destroy]

  root to: 'admins#index'

  match '/signup',  to: 'admins#new',         via: 'get'
  match '/login',   to: 'sessions#new',       via: 'get'
  match '/login',   to: 'sessions#create',    via: 'post'
  match '/logout',  to: 'sessions#destroy',   via: 'delete'
end
