class UsersController < ApplicationController
  def saved_advices
    @user = current_user
    @advices = @user.advices.order('created_at DESC')
  end
end
