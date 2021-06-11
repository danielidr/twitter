class Tweet < ApplicationRecord
  validates_presence_of :content
  belongs_to :user
  has_many :likes

  def like_count
    likes.count
  end

  def retweet_count(id)
    retweets = Tweet.includes(:origin_id).where(origin_id: id)
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
  
  def name_tw_origin(o_id)
    tw_origin = Tweet.find_by(id: o_id)
    id_u_origin = tw_origin.user_id
    u_origin = User.find_by(id: id_u_origin)
    u_origin.name
  end
  
  def pic_tw_origin(o_id)
    tw_origin = Tweet.find_by(id: o_id)
    id_u_origin = tw_origin.user_id
    u_origin = User.find_by(id: id_u_origin)
    u_origin.profile_picture
  end
end
