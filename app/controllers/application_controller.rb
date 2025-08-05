# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/receipts" do
    receipts = Receipt.all.order(:date)
    receipts.to_json(only: [:date], include: { store: { only: [:name] } })
  end
end
