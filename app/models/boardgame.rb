class Boardgame < ApplicationRecord
    has_many :boardgame_categories
    has_many :categories, through: :boardgame_categories
    has_many :user_reviews
    has_many :user_boardgames
    has_many :users, through: :user_boardgames

    def stringify_description

    end

end
