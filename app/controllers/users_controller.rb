class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create]
  before_action :authenticate_user, :only => [:profile, :settings]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users/
  def create
    @user = User.create(user_params)

    if @user.save
      flash[:notice] = "You signed up successfully. Now you can login."
      redirect_to(:controller => 'sessions', :action => 'login')
    else
      flash[:notice] = "Form is invalid"
      render "new"
    end
  end

  # GET /users/:id/profile
  def profile
    if (session[:user_id].to_s != params[:id])
      redirect_to(:controller => 'users', :action => 'profile', :id => session[:user_id])
    else
      render "profile"
    end
  end

  # GET /users/:id/settings
  def settings
    render "settings"
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :name)
    end
end
