Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :profiles, only: [:index, :show, :create, :edit, :update] do
    collection do
      get :top
      get :recent
      get :activity
    end

    member do
      get my_games
      get my_bookings
    end
  end

  resources :games do
    resources :bookings, only:[ :new, :create ] # current user is always known => joint table only need game_id via URL
    collection do
      get :top # example
    end

    member do
      get :reviews
    end
  end

  resources :bookings, only: [ :show, :index, :edit, :update] do
    resources :reviews, only: [ :new, :create]
  end
  resources :reviews, only: [ :show, :index, :edit, :update]

  resources :genres, only: [ :index, :create, :destroy]
  resources :consoles, only: [ :index, :create, :destroy]
end
