class Friend < ApplicationRecord
  belongs_to :user

  def self.ids_friends(id)
    friends = Friend.where(friend_id: id)
    friends.pluck(:user_id)
  end
  
end
