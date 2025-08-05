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
    begin
      parsed_date = Date.parse(params[:date])
    rescue ArgumentError
      status 400
      return { error: "Invalid date format. Use YYYY-MM-DD." }.to_json
    end

    new_entry = Entry.create(
      child: params[:child],
      milestone: params[:milestone], # First Smile
      note: params[:note],
      date: parsed_date,
      age_months: params[:age_months]
    )

    status 201
    new_entry.to_json
  end

  patch "/entries/:id" do
  end

  delete "/entries/:id" do
  end
end
