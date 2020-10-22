class UserReview < ApplicationRecord
    belongs_to :user
    belongs_to :boardgame

    validates :review, presence: true
    validates :rating, presence: true


    def self.highest_rated
        games_hash = {}
        all.each do |review|
            if review.rating > 0
                games_hash[review.boardgame] = review.boardgame.avg_rating
            end          
        end
        array = games_hash.sort_by {|k,v| -v}.to_h
    end


end
