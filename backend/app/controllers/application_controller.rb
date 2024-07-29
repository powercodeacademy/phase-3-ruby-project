# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/board_games" do
    board_games = BoardGame.all
    board_games.to_json
  end

  get "/board_games/:id" do
    board_game = BoardGame.find(params[:id])
    board_game.to_json
  end
end
