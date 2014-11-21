class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  # def vote
  #   @user = current_user
  #   @user.update_vote 
  # end
end
