class UserReview < ApplicationRecord
    belongs_to :user
    belongs_to :boardgame
end
