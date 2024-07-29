class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :collection_board_game
  has_many :board_games, through: :collection_board_game
end
