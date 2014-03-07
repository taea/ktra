class SessionsController < ApplicationController
  def create
    @user = User.authentication(auth_hash, current_user)
    session[:user_id] = @user.id
    redirect_to '/'
  end

  def failure
    redirect_to root_path, notice: 'OAuth Failure'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
