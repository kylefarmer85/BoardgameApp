class BoardgamesController < ApplicationController

    def home
        @boardgames = Boardgame.all
        @categories = Category.all
        @reviews = UserReview.all
        # @top = @boardgame.max {|boardgame, thumbs| thumbs}
        @boardgame = Boardgame.new
    end

    def show
        @boardgame = Boardgame.find_by(params[:id])
        @desc = @boardgame.description
    end



end
