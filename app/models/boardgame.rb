class Boardgame < ApplicationRecord
    has_many :boardgame_categories
    has_many :categories, through: :boardgame_categories
    has_many :user_reviews
    has_many :user_boardgames
    has_many :users, through: :user_boardgames

    def stringify_description

    end

    def avg_rating
        if self.user_reviews.count > 0
        sum = 0
        count = 0
        self.user_reviews.each do |user_review|
            if user_review.rating != nil
            sum += user_review.rating
            count += 1
            end
        end
        sum / count
    end
    end


end
