class UserBoardgamesController < ApplicationController
    before_action :current_user, only: [ ]

    def show
        @user = current_user
    end

    def create
        @user_boardgame = UserBoardgame.create(user_id: current_user.id, boardgame_id: params[:boardgame_id])
        flash[:errors] = @user_boardgame.errors.full_messages
        redirect_to user_boardgame_path(current_user)


    end

    def add_to_wishlist

    end

    def destroy
        UserBoardgame.find_by(user_id: current_user.id, boardgame_id: params[:id]).destroy
        redirect_to user_boardgame_path(current_user)
    end

end
