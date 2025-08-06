class AttendeeController < ApplicationController
  get "/attendees" do
    attendees = Attendee.all
    attendees.to_json
  end

  get "/attendees/:id/concerts" do
    attendee = Attendee.find(params[:id])
    attendee.concerts.to_json
  end
end
