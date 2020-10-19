class Boardgame < ApplicationRecord
    belongs_to :category
    has_many :user_reviews
    has_many :user_boardgames
    has_many :users, through: :user_reviews
    has_many :users, through: :user_boardgames



end
