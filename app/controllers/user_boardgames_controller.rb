class UserBoardgamesController < ApplicationController
    before_action :current_user, only: [ ]

    def show
        @user = current_user
    end

    def add_to_owned

    end

    def add_to_wishlist

    end

    

end
