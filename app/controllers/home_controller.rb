class HomeController < ApplicationController

  def index
    @tweet = Tweet.new
    @tweets = Tweet.all.order(created_at: :DESC).page(params[:page])
  end
  
end
