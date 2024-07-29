# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/board_games" do
    { message: "Good luck with your project!" }.to_json
  end
end
