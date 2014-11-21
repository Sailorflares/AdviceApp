class AdvicesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  def index
    @advice = Advice.all
  end

  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.find_or_create_by(advice_params)
    if @advice# this path means the advice was found or newly created
      #save initial user_advice data
      current_user.user_advices.find_or_create_by(advice_id: @advice.id)
      redirect_to user_path(current_user)
    else #this means something went wrong
      redirect_to new_advice_path
    end
  end

  def vote
    @advice = Advice.find(params[:id])
  end

  private
    def advice_params
      params.require(:advice).permit(:url)
    end

end