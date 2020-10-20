class BoardgamesController < ApplicationController
    skip_before_action :require_login, only: [:home, :show]
    def home
    end

    def show
        @boardgame = Boardgame.find_by(params[:id])
    end

    

end
