Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new, :edit, :create, :update] do
    resources :notes
    resources :questions
<<<<<<< HEAD

    member do
      get 'favorite'
    end
  end

  resources :doctors, only: [:index, :show, :new, :edit, :create, :update]
  

  resources :sessions, only: [:new, :create, :destroy]
  resources :d_sessions, only: [:new, :create, :destroy]
=======
  end
  resources :sessions, only: [:new, :create, :destroy]
>>>>>>> 8e8e1ad165ff0211b4502d055cb1561fa0495e4d

  match 'signup', to: 'users#new', via: 'get'
  match 'signin', to: 'sessions#new', via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'

<<<<<<< HEAD
  match 'signup_doctor', to: 'doctors#new', via: 'get'
  match 'signin_doctor', to: 'd_sessions#new', via: 'get'
  match 'signout_doctor', to: 'd_sessions#destroy', via: 'delete'


=======
>>>>>>> 8e8e1ad165ff0211b4502d055cb1561fa0495e4d
  resources :qbase
  #root 'users#index'
  root 'sessions#new'
end
