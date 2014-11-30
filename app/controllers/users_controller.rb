class UsersController < ApplicationController
  def saved_advices
    @user = current_user
    @advices = @user.advices.order('created_at DESC')
  end

  def upvote
    @user = current_user
    if @user.user_advices.upvote == false
      @user.user_advices.upvote.update(true)
    end
  end
end
