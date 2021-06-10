class LikesController < ApplicationController

    def create
        @like = Like.new(like_params)
        @like.user_id = current_user.id
        @like.save
        redirect_to root_path
    end

    def like_params
        params.require(:like).permit(:tweet_id, :user_id)
    end
    
end