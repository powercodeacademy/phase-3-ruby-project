# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/tools" do
    tools = Tool.all
    tools.to_json
  end

  get "/tools/:id" do
    tool = Tool.find(params[:id])
    tool.to_json
  end
end
