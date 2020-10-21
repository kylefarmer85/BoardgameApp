class UserBoardgame < ApplicationRecord
    belongs_to :boardgame
    belongs_to :user
    validates_uniqueness_of :boardgame, {scope: [:user_id, :boardgame_id], message: "is already in your collection"}




end
