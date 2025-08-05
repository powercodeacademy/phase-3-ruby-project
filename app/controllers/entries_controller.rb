class EntriesController < ApplicationController
  get "/entries" do
    Entry.all.to_json
  end

  get "/entries/:id" do
  end

  post "/entries" do
  end

  patch "/entries/:id" do
  end

  delete "/entries/:id" do
  end
end
