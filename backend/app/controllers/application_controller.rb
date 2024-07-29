# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/bnbs" do
    bnbs = Bnb.all
    bnbs.to_json
  end

  get "/bnbs/sort_by_price" do
    bnb = Bnb.order(cost_per_night: :desc)
    bnb.to_json
  end
end
