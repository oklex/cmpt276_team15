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

  #GET/users/:id/edit
  def edit
    if (session[:user_id].to_s != params[:id] and !@current_user[:admin])
      redirect_to(:controller => 'users', :action => 'edit', :id => session[:user_id])
    else
      @user = User.find(params[:id])
      render 'edit'
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
    if (session[:user_id].to_s != params[:id] && !@current_user[:admin])
      render :edit
    else
      @user = User.find(params[:id])
      update_game_score = false

      if (user_params[:total_duration].present?)
        update_game_score = true
        user_params[:total_duration] =
                (@user[:total_duration].present? ? @user[:total_duration] : 0)
                + user_params[:total_duration].to_i
      end
      if (user_params[:total_points].present?)
        update_game_score = true

      end
      if (user_params[:enemies_killed].present?)
        update_game_score = true

      end
      if (user_params[:projectiles_fired].present?)
        update_game_score = true

      end
      if (user_params[:accuracy].present?)
        update_game_score = true
      end

      if @user.update(user_params)
        if (update_game_score)
          redirect_to(:controller => 'users', :action => 'profile', :id => session[:user_id])
        else
          redirect_to :controller => 'users', :action => 'index', notice: 'User was successfully updated.'
        end
      else
        render :edit
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
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :name, :admin,
                  :total_duration, :longest_duration, :total_points, :max_points, :enemies_killed, :projectiles_fired, :accuracy)
    end
end
