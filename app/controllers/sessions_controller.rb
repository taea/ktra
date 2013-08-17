class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_oauth(auth_hash, current_user)
    session[:user_id] = @user.id
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
