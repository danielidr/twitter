class LikesController < ApplicationController

    def create
        @like = Like.new(like_params)
        @like.user_id = current_user.id
        @like.save
        redirect_to root_path
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to root_path
    end

    private

    def like_params
        params.require(:like).permit(:tweet_id, :user_id)
    end

    
end