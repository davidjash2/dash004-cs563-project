class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user  = User.find(session[:user_id])
    end
  end

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
    redirect_to root_path
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
