class CreateBoardgames < ActiveRecord::Migration[6.0]
  def change
    create_table :boardgames do |t|
      t.string :name
      t.text :description
      t.integer :min_players
      t.integer :max_players
      t.integer :year_published
      t.integer :category_id
      t.string  :image_url
      
      t.timestamps
    end
  end
end
