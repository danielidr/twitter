class Tweet < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  has_many :likes

  def like_count
    likes.count
  end

  def retweet_count(id)
    retweets = Tweet.where(origin_id: id)
    retweets.count
  end
  
end
