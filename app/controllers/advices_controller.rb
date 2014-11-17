class AdvicesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.create(advice_params)
    @advice.user = current_user
    @advice.save
    if @advice.save
      redirect_to user_advices_path
    else
      redirect_to new_user_advice_path
    end
  end

  def index
    @user = current_user
  end

  private

  def advice_params
    params.require(:advice).permit(:advice_text, :url)
  end

end