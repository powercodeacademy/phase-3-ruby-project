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

  def get_attendees
    response = RestClient.get("#{@base_url}/attendees")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch attendee: #{e.message}" }
  end

  def create_concert
    response = RestClient.get("#{@base_url}/concerts", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to create concert: #{e.message}" }
  end
end
