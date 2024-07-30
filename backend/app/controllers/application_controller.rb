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

  post "/create_guest_and_stay" do
    guest = Guest.new(name: params[:name], age: params[:age])

    if guest.save
      stay = Stay.new(
        bnb_id: params[:bnb_id],
        guest_id: guest.id,
        check_in: params[:check_in],
        check_out: params[:check_out]
      )

      if stay.save
        stay.to_json(include: { guest: { only: [:name, :age] } })
      end
    end
  end

  delete '/stays/:id' do
    stay = Stay.find(params[:id])
    stay.destroy
    stay.to_json
  end

  patch '/guest_log/:id' do
    entry = GuestLogEntry.find(params[:id])
    entry.update(
      message: params[:newMessage],
    )
    entry.to_json
  end

  delete '/guest_log_delete/:id' do
    entry = GuestLogEntry.find(params[:id])
    entry.destroy
    entry.to_json
  end
end
