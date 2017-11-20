class UsersController < ApplicationController
  before_action :save_login_state, :only => [:new, :create]
  before_action :authenticate_user, :only => [:profile, :settings, :edit, :update, :index]

  #GET /users
  def index
    if (!@current_user[:admin])
      redirect_to(:controller => 'users', :action => 'profile', :id => session[:user_id])
    else
      @users = User.all
    end
  end

  #GET/users/edit
  def edit
    if (session[:user_id].to_s != params[:id])
      if (!@current_user[:admin])
        redirect_to(:controller => 'users', :action => 'edit', :id => session[:user_id])
      else
        @user = User.find(params[:id])
        render "edit"
      end
    end
  end

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

  #PATCH/PUT /users/1
  def update
    respond_to do |format|
      if (session[:user_id].to_s != params[:id])
        if (!@current_user[:admin])
          format.html {render :edit}
        else
          @user = User.find(params[:id])
          if @user.update(user_params)
            format.html {redirect_to :controller => 'users', :action => 'index', notice: 'User was successfully updated.'}
          end
        end
      end
    end
  end

  #DELETE/users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed'}
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
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :name, :admin)
    end
end
