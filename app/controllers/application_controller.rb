class ApplicationController < ActionController::Base
  helper_method :current_user, :sign_in?
  protect_from_forgery

  private

  def current_user
    @user ||= User.find_by(id: session[:user_id])
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
