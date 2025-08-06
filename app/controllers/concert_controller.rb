class ConcertController < ApplicationController
  get "/concerts" do
    concerts = Concert.all
    concerts.to_json(include: :attendees)
  end

  get "/concerts/:id" do
    concert = Concert.find(params[:id])
    concert.to_json(include: :attendees)
  end

  post "/concerts" do
    concert = Concert.create(
      band_name: params[:band_name],
      event_date: params[:event_date],
      venue: params[:venue],
      city: params[:city]
    )
    concert.to_json
  end
end
