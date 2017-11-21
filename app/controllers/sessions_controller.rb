class SessionsController < ApplicationController
  before_action :save_login_state, :only => [:login, :login_attempt]
  before_action :authenticate_user, :only => [:logout]

  # GET /sessions/login
  def login
    render "login"
  end

  # POST /sessions/login
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to(:controller => 'splashscreen', :action => 'index')
    else
      flash[:notice] = "Invalid username or password."
      render "login"
    end
  end

  # GET /sessions/logout
  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
    flash.discard
  end
end
