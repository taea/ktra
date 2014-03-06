class ApplicationController < ActionController::Base
  helper_method :current_user, :sign_in?
  protect_from_forgery

  def current_user
    if session[:user_id]
      User.find(session[:user_id]) 
    else
      nil
    end
  end

  def sign_in?
    current_user ? true : nil
  end

  def authenticate_user!
    unless sign_in?
      redirect_to root_path, notice: 'Please Sign in with Twitter'
    end
  end
end
