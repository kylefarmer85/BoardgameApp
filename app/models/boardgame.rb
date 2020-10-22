class Boardgame < ApplicationRecord
    has_many :boardgame_categories
    has_many :categories, through: :boardgame_categories
    has_many :user_reviews
    has_many :user_boardgames
    has_many :users, through: :user_boardgames

    def self.search(search)
    if search
        boardgame = Boardgame.find_by(name: search.titlecase)
        if boardgame

            Boardgame.where("name LIKE ?", "%" + search + "%") #+
            #Boardgame.where("name LIKE ?", "%" + search.first(3) + "%").limit(10)
        else
            Boardgame.where("name LIKE ?", "%" + search.first(3) + "%").limit(10)
        end
    else
       Boardgame.all.sample(7)
    end
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

    def self.highest_rated
        games_hash = {}
        all.each do |game|
            if game.user_reviews.count > 0
                games_hash[game] = game.avg_rating
            end          
        end
        array = games_hash.sort_by {|k,v| -v}.to_h
    end



end
