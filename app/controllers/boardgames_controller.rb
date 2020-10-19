class BoardgamesController < ApplicationController

    def home
    end

    def show
        @boardgame = Boardgame.find_by(params[:id])
    end

    

end
