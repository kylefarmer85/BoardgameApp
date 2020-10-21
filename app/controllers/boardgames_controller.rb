class BoardgamesController < ApplicationController
    skip_before_action :require_login, only: [:home, :show, :index, :create]
    def index
        @boardgames = Boardgame.search(params[:name])
        @cat = Boardgame.search(params[:category_id])
        @category = Category.new
        @categories = Category.all

    end

    def show
        @boardgame = Boardgame.find(params[:id])
    end





end
