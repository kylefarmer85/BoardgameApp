class UserReview < ApplicationRecord
    belongs_to :user
    belongs_to :boardgame

    validates :review, presence: true
    validates :rating, presence: true

end
