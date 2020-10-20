class CreateBoardgameCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :boardgame_categories do |t|
      t.string :boardgame_id
      t.string :category_id

      t.timestamps
    end
  end
end
