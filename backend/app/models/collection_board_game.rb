class CollectionBoardGame < ActiveRecord::Base
  belongs_to :board_game
  belongs_to :collection
end
