class UsersController < ApplicationController
  def show
    @advice = Advice.new
    @user = current_user
  end

  def index
    @users = User.all
  end
end
