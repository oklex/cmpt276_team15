Rails.application.routes.draw do

  root 'splashscreen#index', :as => 'home'

  get 'sessions/login', :to => 'sessions#login'
  post 'sessions/login', :to => 'sessions#login_attempt'
  get 'sessions/logout', :to => 'sessions#logout'
  post 'sessions/login_with_google', :to =>'sessions#login_google'
  post 'games', :to=>'users#update'

  resources :users, defaults: { format: 'html' }, only: [:new, :create, :edit, :update, :index, :destroy] do
    member do
      get :profile
      get :settings
    end
  end
  get 'game', :to => 'game#index'
  get 'game/leaderboard', :to => 'game#leaderboard'
end
