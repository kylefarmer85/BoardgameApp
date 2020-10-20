class Category < ApplicationRecord
    has_many :boardgame_categories
    has_many :boardgames, through: :boardgame_categories
end
