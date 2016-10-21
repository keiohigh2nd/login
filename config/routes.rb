Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :edit, :create, :update] do
    resources :notes
    resources :questions
  end
  resources :sessions, only: [:new, :create, :destroy]

  match 'signup', to: 'users#new', via: 'get'
  match 'signin', to: 'sessions#new', via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'

  resources :qbase
  #root 'users#index'
  root 'sessions#new'
end
