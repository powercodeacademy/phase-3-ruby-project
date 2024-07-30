class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

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

  get "/bnbs/:id/guest_log" do
    bnb = Bnb.find(params[:id])
    guest_log_entries = bnb.guest_log_entries.to_json(include: { guest: { only: [:name] } })
    guest_log_entries
  end

  get "/bnbs/:id/stays_list" do
    bnb = Bnb.find(params[:id])
    stays_with_guests = bnb.stays.to_json(include: { guest: { only: [:name] } })
    stays_with_guests
  end

  post '/guest_log' do
    log_entry = GuestLogEntry.create(
      message: params[:message],
      guest_id: params[:guest_id],
      bnb_id: params[:bnb_id],
      stay_id: params[:stay_id],
      entry_date: params[:entry_date],
    )
    log_entry.to_json
  end
end
