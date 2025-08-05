# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/receipts" do
    receipts = Receipt.all

    if params[:store]
      store = Store.find_by(name: params[:store])
      receipts = receipts.where(store_id: store.id) if store 
    end

    receipts.order(date: :desc).to_json(include: :store)
  end
end
