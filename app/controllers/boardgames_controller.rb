class BoardgamesController < ApplicationController
    skip_before_action :require_login, only: [:home, :show, :index, :create]
    # validates :name, :description, :min_players, :max_players, :year_published, :publisher, presence: :true
    # validates :description, length: {minimum: 100}
    # validates :min_players, length: {minimum: 1}

    def index
        @boardgames = Boardgame.all.sample(6)
        if params[:name] != ""
            @boardgame = Boardgame.search(params[:name])
        end
        @cat = Boardgame.search(params[:category_id])
        @category = Category.new
        @categories = Category.all
    end

    def show
        @boardgame = Boardgame.find(params[:id])
    end

    def new
        @boardgame = Boardgame.new
        @categories = Category.all

    end

    def create
        boardgame = Boardgame.create(boardgame_params)
        category = Category.find(params[:boardgame][:id])
        BoardgameCategory.create(:boardgame_id => boardgame.id, category_id: category.id)
        if  boardgame.save
            redirect_to boardgame_path(boardgame)
        else 
            flash[:errors] = boardgame.errors.full_messages
            redirect_to "/"
        end
    end

    private

    def boardgame_params
        params.require(:boardgame).permit(:name, :description, :min_players, :max_players, :year_published, :image_url, :publisher, :thumb_image, :small_image, :medium_image)
    end
end
