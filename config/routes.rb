Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :edit, :create, :update] do
    resources :notes
    resources :questions

    member do
      get 'favorite'
    end
  end

  resources :doctors, only: [:index, :show, :new, :edit, :create, :update]
  

  resources :sessions, only: [:new, :create, :destroy]
  resources :d_sessions, only: [:new, :create, :destroy]

  match 'signup', to: 'users#new', via: 'get'
  match 'signin', to: 'sessions#new', via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'

  match 'signup_doctor', to: 'doctors#new', via: 'get'
  match 'signin_doctor', to: 'd_sessions#new', via: 'get'
  match 'signout_doctor', to: 'd_sessions#destroy', via: 'delete'


  resources :qbase
  #root 'users#index'
  root 'sessions#new'
end
