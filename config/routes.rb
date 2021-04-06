Rails.application.routes.draw do
  root 'events#index'
  get 'login' => 'sessions#new', as: 'login'
  get 'signup' => 'users#new', as: 'signup'
  get 'logout' => 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :events
  resources :attendances, only: [:new, :create, :destroy, :update]
end
