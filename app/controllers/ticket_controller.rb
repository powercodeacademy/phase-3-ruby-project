class TicketController < ApplicationController
  delete "/tickets" do
    data = JSON.parse(request.body.read)

    attendee_id = data["attendee_id"]
    concert_id = data["concert_id"]

    ticket = Ticket.find_by(attendee_id: attendee_id, concert_id: concert_id)

    if ticket
      ticket.destroy
      { message: "Ticket deleted successfully." }.to_json
    else
      status 404
      { error: "Ticket not found." }.to_json
    end
  end
end
