class AttendeeController < ApplicationController
  get "/attendees" do
    attendees = Attendee.all
    attendees.to_json
  end

  get "/attendees/:id/concerts" do
    attendee = Attendee.find(params[:id])
    attendee.concerts.to_json
  end

  post "/attendees" do
    attendee = Attendee.create(params)
    attendee.to_json
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
