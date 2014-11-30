class UserAdvicesController < ApplicationController
  def update
    @user_advice = UserAdvice.find(params[:id])
  end

end
