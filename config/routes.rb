Rails.application.routes.draw do

  root :to => "sessions#login"

  get 'sessions/login', :to => "sessions#login"
  post 'sessions/login', :to => "sessions#login_attempt"
  get 'sessions/logout', :to => "sessions#logout"

  resource :users do
    collection do
      get :new
      post :create
    end
    member do
      get :home
      get :profile
      get :settings
    end
  end
end
