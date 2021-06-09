class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  def like_count
    like.count
  end
  
end
