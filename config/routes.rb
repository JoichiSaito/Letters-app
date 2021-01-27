Rails.application.routes.draw do
  root 'home#index'

  get 'mypage', to: 'sessions#me'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    resource :relationships, only: %i[create destroy]
    get :follows, on: :member
    get :followers, on: :member

    resource :requests, only: %i[show create destroy]
    resource :answers, only: %i[create destroy]
  end

  resources :boards do
    resource :joins, only: %i[show create destroy]
  end
end
