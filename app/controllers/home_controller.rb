class HomeController < ApplicationController

  def index
    if current_user
      friends_id = Friend.ids_friends(current_user.id)
      @tweets = Tweet.tweets_for_me(friends_id).order(created_at: :DESC).page(params[:page])
    else
      @tweets = Tweet.all.order(created_at: :DESC).page(params[:page])
    end
    @tweet = Tweet.new
  end
  
end
