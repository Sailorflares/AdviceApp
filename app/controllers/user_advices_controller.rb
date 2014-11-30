class UserAdvicesController < ApplicationController
  def update
    @user_advice = UserAdvice.find(params[:id])
    # binding.pry
    if @user_advice.upvote == nil || @user_advice.upvote == false
      @user_advice.update(:upvote => true)
    elsif @user_advice.upvote == true
      @user_advice.update(:upvote => false)
    end
  end

end
