class AttendeeController < ApplicationController
  get "/attendees" do
    attendees = Attendee.all
    attendees.to_json(include: :concerts)
  end

  get "/attendees/:id" do
    attendee = Attendee.find(params[:id])
    attendee.to_json(include: :concerts)
  end

  get "/attendees/:id/concerts" do
    attendee = Attendee.find(params[:id])
    attendee.concerts.to_json
  end

  post "/attendees" do
    attendee = Attendee.create(params)
    attendee.to_json
  end

  post "/attendees/:id/concerts" do
    attendee = Attendee.find(params[:id])
    Ticket.create(
      concert_id: params[:concert_id],
      attendee_id: attendee.id
    ).to_json
  end

  patch "/attendees/:id" do
    attendee = Attendee.find(params[:id])
    attendee.update(params)
    attendee.to_json
  end

  delete "/attendees/:id" do
    attendee = Attendee.find(params[:id])
    attendee.destroy
    { message: "attendee deleted successfully." }.to_json
  end
end
