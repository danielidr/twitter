class FriendsController < ApplicationController

    def create
        @friend = Friend.new(friend_params)
        @friend.friend_id = current_user.id
        @friend.save
        redirect_to tweets_path
    end

    def destroy
        @friend = Friend.find(params[:id])
        @friend.destroy
        redirect_to tweets_path
    end

    private

    def friend_params
        params.require(:friend).permit(:friend_id, :user_id)
    end

    
end