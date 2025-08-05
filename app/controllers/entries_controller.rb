class EntriesController < ApplicationController
  get "/entries" do
    Entry.all.to_json
  end

  get "/entries/:id" do
    entry = Entry.find_by(id: params[:id])
    if entry
      entry.to_json
    else
      status 404
      { error: "Entry not found" }.to_json
    end
  end

  post "/entries" do
  end

  patch "/entries/:id" do
  end

  delete "/entries/:id" do
  end
end
