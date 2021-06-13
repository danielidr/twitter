class Tweet < ApplicationRecord
  validates :content, presence: true, length: {maximum: 280}
  belongs_to :user
  has_many :likes
  paginates_per 50

  def like_count
    likes.count
  end

  def retweet_count(id)
    retweets = Tweet.where(origin_id: id)
    retweets.count
  end

  def user_like?(id)
    users_like = likes.pluck(:user_id)
    users_like.include? id
  end

  def id_like(u_id)
    like = likes.find_by(user_id: u_id)
    if like != nil
      like.id
    else
      0
    end
  end

  def user_tw_origin(o_id)
    tw_origin = Tweet.find_by(id: o_id)
    tw_origin.user
  end

  def time_tweet(date)
    date_stg = date.in_time_zone("Santiago")
    dif_time = Time.now - date_stg

    time_min = (dif_time/60).round

    if time_min <= 60
      time_t = "#{time_min} min"
    else
      time_hours = time_min/60
      time_t = "#{time_hours} h"
    end
    time_t 
  end
    
end
