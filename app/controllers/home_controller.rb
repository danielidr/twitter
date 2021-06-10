class HomeController < ApplicationController

  def index
    @tweets = Tweet.all.order(created_at: :DESC).page(params[:page])
    @tweet = Tweet.new
  end
  
end
