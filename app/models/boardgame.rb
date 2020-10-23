class Boardgame < ApplicationRecord
  has_many :boardgame_categories
  has_many :categories, through: :boardgame_categories
  has_many :user_reviews
  has_many :user_boardgames
  has_many :users, through: :user_boardgames

  validates :name, :description, :min_players, :max_players, :year_published, :publisher, presence: :true

  def self.search(search)
    if search
      boardgame = Boardgame.find_by(name: search.titlecase)
      if boardgame

        Boardgame.where('name LIKE ?', '%' + search + '%') #+
      # Boardgame.where("name LIKE ?", "%" + search.first(3) + "%").limit(10)
      else
        Boardgame.where('name LIKE ?', '%' + search.first(3) + '%').limit(10)
      end
    end
  end

  def avg_rating
    if user_reviews.count > 0
      sum = 0
      count = 0
      user_reviews.each do |user_review|
        unless user_review.rating.nil?
          sum += user_review.rating
          count += 1
        end
      end
      sum / count
    end
  end
end
