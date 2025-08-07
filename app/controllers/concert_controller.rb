class ConcertController < ApplicationController
  get "/concerts" do
    concerts = Concert.all
    concerts.to_json(include: :attendees)
  end

  get "/concerts/:id" do
    concert = Concert.find(params[:id])
    concert.to_json(include: :attendees)
  end

  get "/concerts/:id/attendees" do
    concert = Concert.find(params[:id])
    concert.attendees.to_json
  end

  post "/concerts" do
    concert = Concert.create(params)
    concert.to_json
  end

  patch "/concerts/:id" do
    concert = Concert.find(params[:id])
    concert.update(params)
    concert.to_json
  end

  delete "/concerts/:id" do
    concert = Concert.find(params[:id])
    concert.destroy
    { message: "Concert deleted successfully." }.to_json
  end
end
