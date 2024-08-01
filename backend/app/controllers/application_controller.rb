class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/bnbs" do
    bnbs = Bnb.all.map do |bnb|
      bnb.as_json.merge(
        total_revenue: bnb.total_revenue,
        bnb_activity: bnb.bnb_activity,
        avg_guest_age: bnb.avg_guest_age,
        revenue_forcasting: bnb.revenue_forcasting
      )
    end
    bnbs.to_json
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

  post "/guest_log" do
    log_entry = GuestLogEntry.create(
      message: params[:message],
      guest_id: params[:guest_id],
      bnb_id: params[:bnb_id],
      stay_id: params[:stay_id],
      entry_date: params[:entry_date]
    )
    log_entry.to_json(include: { guest: { only: [:name] } })
  end

  post "/create_guest_and_stay" do
    guest = Guest.new(name: params[:name], age: params[:age])

    guest.save

    stay = Stay.new(
      bnb_id: params[:bnb_id],
      guest_id: guest.id,
      check_in: params[:check_in],
      check_out: params[:check_out]
    )

    stay.save

    stay.to_json(include: { guest: { only: [:name, :age] } })
  end

  patch "/guest_log/:id" do
    entry = GuestLogEntry.find(params[:id])
    entry.update(
      message: params[:newMessage]
    )
    entry.to_json
  end

  delete "/guest_log/:id" do
    entry = GuestLogEntry.find(params[:id])
    entry.destroy
    entry.to_json
  end

  get "/bnbs/sort_by_price_desc" do
    bnb = Bnb.order(cost_per_night: :desc)
    bnb.to_json
  end

  get "/bnbs/sort_by_price_asc" do
    bnb = Bnb.order(cost_per_night: :asc)
    bnb.to_json
  end

  get "/bnbs/sort_by_most_popular" do
    bnb = Bnb.most_popular
    bnb.to_json
  end
end
