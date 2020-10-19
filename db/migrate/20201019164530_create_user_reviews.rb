class CreateUserReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :user_reviews do |t|
      t.string :review
      t.integer :rating
      t.integer :thumbs
      t.integer :user_id
      t.integer :boardgame_id

      t.timestamps
    end
  end
end
