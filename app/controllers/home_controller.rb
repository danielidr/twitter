class HomeController < ApplicationController

  def index
    if current_user 
      friends_id = Friend.ids_friends(current_user.id)
      friends_tweets = Tweet.tweets_for_me(friends_id).order(created_at: :DESC).page(params[:page])
      @tweets = friends_tweets
      if params[:q]
        @tweets = @tweets.where('content ILIKE ?', "%#{params[:q]}%")
        if @tweets.nil?
          @tweets = friends_tweets
        end
      else
        @tweets = friends_tweets
      end
    else
      all_tweets = Tweet.all.order(created_at: :DESC).page(params[:page])
      @tweets = all_tweets
      if params[:q]
        @tweets = @tweets.where('content ILIKE ?', "%#{params[:q]}%")
        if @tweets.nil?
          @tweets = all_tweets
        end
      else
        @tweets = all_tweets
      end
    end
    @tweet = Tweet.new
  end
  
end
