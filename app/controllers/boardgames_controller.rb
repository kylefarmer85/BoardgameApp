class BoardgamesController < ApplicationController
    skip_before_action :require_login, only: [:home, :show]
    def home
        @boardgames = Boardgame.all
        @categories = Category.all
        @reviews = UserReview.all
        # @top = @boardgame.max {|boardgame, thumbs| thumbs}
        @boardgame = Boardgame.new
    end

    def show
        @boardgame = Boardgame.find(params[:id])
        @desc = @boardgame.description
    end



end
