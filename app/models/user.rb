class User < ApplicationRecord
    has_many :user_reviews, dependent: :destroy
    has_many :user_boardgames, dependent: :destroy
    has_many :boardgames, through: :user_boardgames

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    has_secure_password



    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
