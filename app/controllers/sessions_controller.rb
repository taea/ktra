class SessionsController < ApplicationController
  def twitter
    @user = User.authentication(auth_hash, current_user)
    sign_in(@user)
    redirect_to root_path, notice: t('devise.omniauth_callbacks.success', kind: :twitter)
  end

  def failure
    redirect_to root_path, notice: 'OAuth Failure'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
