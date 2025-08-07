require "pry"

class APIClient
  def initialize(base_url = "http://localhost:9292")
    @base_url = base_url
  end

  def get_concerts
    response = RestClient.get("#{@base_url}/concerts")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch concerts: #{e.message}" }
  end

  def get_concert(id)
    response = RestClient.get("#{@base_url}/concerts/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch concert: #{e.message}" }
  end

  def get_attendees
    response = RestClient.get("#{@base_url}/attendees")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch attendee: #{e.message}" }
  end

  def get_attendee(id)
    response = RestClient.get("#{@base_url}/attendees/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch attendee: #{e.message}" }
  end

  def get_concerts_by_attendee(attendee_id)
    response = RestClient.get("#{@base_url}/attendees/#{attendee_id}/concerts")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch attendee: #{e.message}" }
  end

  def new_concert(data)
    response = RestClient.post("#{@base_url}/concerts", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to create concert: #{e.message}" }
  end

  def new_attendee(data)
    response = RestClient.post("#{@base_url}/attendees", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to create attendee: #{e.message}" }
  end

  def change_concert(id, data)
    response = RestClient.patch("#{@base_url}/concerts/#{id}", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to update concert: #{e.message}" }
  end

  def change_attendee(id, data)
    response = RestClient.patch("#{@base_url}/attendees/#{id}", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to update concert: #{e.message}" }
  end

  def remove_concert(id)
    response = RestClient.delete("#{@base_url}/concerts/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to delete owner: #{e.message}" }
  end

  def remove_attendee(id)
    response = RestClient.delete("#{@base_url}/attendees/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to delete owner: #{e.message}" }
  end

  def add_ticket(attendee_id, concert_id)
    data = { concert_id: concert_id }
    response = RestClient.post("#{@base_url}/attendees/#{attendee_id}/concerts", data.to_json,
                               content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to create new concert: #{e.message}" }
  end
end
