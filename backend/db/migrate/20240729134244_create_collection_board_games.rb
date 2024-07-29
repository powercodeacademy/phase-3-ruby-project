class CreateCollectionBoardGames < ActiveRecord::Migration[6.1]
  def change
    create_table :collection_board_games do |t|
      t.references :board_game
      t.references :collection
      t.timestamps
    end
  end
end
