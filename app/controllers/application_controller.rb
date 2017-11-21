class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  protected
  def authenticate_user
    redirect_to(:controller => 'sessions', :action => 'login') unless @current_user.present?
  end

  protected
  def set_current_user
    if session[:user_id]
      # set current user object to @current_user object variable
      @current_user = User.find session[:user_id]
      true
    end
    false
  end

  protected
  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'users', :action => 'profile', :id => session[:user_id])
      return false
    else
      return true
    end
  end

end
