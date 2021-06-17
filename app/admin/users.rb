ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :name, :profile_picture, friend_ids: [], tweet_ids: [], like_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :profile_picture]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :email
  filter :name

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :friends do |user|
      Friend.where(friend_id: user.id).count
    end
    column :tweets do |user|
      user.tweets.count
    end
    column :likes do |user|
      user.likes.count
    end
    column "Retweets", :tweet do |user|
      user.tweets.where(is_rt: true).count
    end
    actions
  end
end
