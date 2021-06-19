class HashtagsController < ApplicationController
  def show
    @tweets = Tweet.all.order(created_at: :DESC).page(params[:page])
    @tweets = @tweets.where('content LIKE ?', "%#{params[:ht]}%")
  end
end
