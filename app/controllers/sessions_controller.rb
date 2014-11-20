class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def index
    if current_user
      redirect_to user_path(current_user)
    end
  end

end
