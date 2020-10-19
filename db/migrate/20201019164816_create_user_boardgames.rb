class CreateUserBoardgames < ActiveRecord::Migration[6.0]
  def change
    create_table :user_boardgames do |t|
      t.integer :user_id
      t.integer :boardgame_id
      t.boolean :owned

      t.timestamps
    end
  end
end
