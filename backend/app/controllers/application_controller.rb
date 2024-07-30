# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/tools" do
    sort_by = params[:sort_by] || "name"
    tools = if sort_by == "name"
              Tool.order(:name)
            elsif sort_by == "available"
              Tool.where(availability: true)
            elsif sort_by == "id"
              Tool.order(:id)
            else
              Tool.order(:name)
            end
    binding.pry
    tools.to_json
  end

  get "/tools/:id" do
    tool = Tool.find(params[:id])
    tool.to_json
  end

  post "/tools" do
    tool = Tool.create(
      name: params[:name],
      description: params[:description],
      price_per_day: params[:price_per_day],
      category: params[:category],
      image: params[:image]
    )
    tool.to_json
  end
end
