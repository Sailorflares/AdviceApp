class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = current_user
    @advice = Advice.new
    @advices = @user.advices.order('created_at DESC')
  end

  def upvote
    @user = current_user
    if @user.user_advices.upvote == false
      @user.user_advices.upvote.update(true)
    end
  end
end
