Rails.application.routes.draw do
  root 'users#index'

  get 'mypage', to: 'sessions#me'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member

    resource :requests, only: [:show, :create, :destroy]
    resource :answers, only: [:create, :destroy]
  end

  resources :boards do
    resource :joins, only: [:show, :create, :destroy]
  end
end
