class AddColumsToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :is_rt, :boolean, default: false
    add_column :tweets, :origin_id, :integer
  end
end
