class AdvicesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.find_or_create_by(url: params["advice"]["url"])
    if @advice# this path means the advice was found or newly created
      @advice.tag_list.add(params["advice"]["tag_list"], :parse => true)
      @advice.save
      current_user.user_advices.create(advice_id: @advice.id)
      #do I need to do something redirective if this user_advices doesn't save?
      redirect_to user_path(current_user)
    else #this means something went wrong
      redirect_to new_advice_path
    end
  end

  def index
    @advice = Advice.new
    if params[:tag]
      @advices = Advice.tagged_with(params[:tag])
    else
      @advices = Advice.all
    end
  end

  private

  def advice_params
    params.require(:advice).permit(:url, { tag_list: [] })
  end

end