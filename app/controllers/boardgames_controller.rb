class BoardgamesController < ApplicationController
    skip_before_action :require_login, only: [:home, :show, :index, :create]
    # validates :name, :description, :min_players, :max_players, :year_published, :publisher, presence: :true
    # validates :description, length: {minimum: 100}
    # validates :min_players, length: {minimum: 1}

    def index
        @boardgames = Boardgame.search(params[:name])
        @category = Category.new
        @categories = Category.all
        @new_game = Boardgame.new

    end

    def show
        @boardgame = Boardgame.find(params[:id])
    end

    def new
    end

    def create
        boardgame = Boardgame.create(boardgame_params)
        category = Category.create_or_find_by(params[:category_ids])
        BoardgameCategory.create(:boardgame_id => boardgame.id, category_id: category.id )
        redirect_to boardgame_path(boardgame)
    end

    private

    def boardgame_params
        params.require(:boardgame).permit(:name, :description, :min_players, :max_players, :year_published, :image_url, :publisher, :thumb_image, :small_image, :medium_image)
    end
end
