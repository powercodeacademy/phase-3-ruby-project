class EntriesController < ApplicationController
  get "/entries" do
    Entry.all.to_json(include: %i[child milestone])
  end

  get "/entries/:id" do
    entry = Entry.find_by(id: params[:id])
    if entry
      entry.to_json(include: %i[child milestone])
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
      child_id: params[:child_id],
      milestone_id: params[:milestone_id],
      note: params[:note],
      date: parsed_date,
      age_months: params[:age_months]
    )

    status 201
    new_entry.to_json
  end

  patch "/entries/:id" do
    entry = Entry.find_by(id: params[:id])

    if entry.nil?
      status 404
      return { error: "Entry not found" }.to_json
    end
    begin
      parsed_date = Date.parse(params[:date])
    rescue ArgumentError
      status 400
      return { error: "Invalid date format. Please use YYYY-MM-DD." }.to_json
    end

    entry.update(
      child_id: params[:child_id],
      milestone_id: params[:milestone_id],
      note: params[:note],
      date: parsed_date,
      age_months: params[:age_months]
    )

    entry.to_json
  end

  delete "/entries/:id" do
    entry = Entry.find_by(id: params[:id])

    if entry.nil?
      status 404
      return { error: "Entry not found" }.to_json
    end

    entry.destroy

    entry.to_json
  end

  get "/children/:id/entries" do
    child = Child.find_by(id: params[:id])

    if child.nil?
      status 404
      return { error: "Child not found" }.to_json
    end

    child.entries.to_json(include: %i[child milestone])
  end
end
