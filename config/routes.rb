Rails.application.routes.draw do

  root :to => "sessions#login"

  get 'sessions/login', :to => 'sessions#login'
  post 'sessions/login', :to => 'sessions#login_attempt'
  get 'sessions/logout', :to => 'sessions#logout'

  resources :users do
    collection do
      get 'new', :to => 'users#new'
      post 'create', :to => 'users#create'
    end
    member do
      get :profile
      get :settings
    end
  end
end
