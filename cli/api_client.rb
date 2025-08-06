class APIClient
  def initialize(base_url = "http://localhost:9292")
    @base_url = base_url
  end

  def view_all_concerts
    response = RestClient.get("#{@base_url}/concerts")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch concerts: #{e.message}" }
  end

  def view_all_attendees
    response = RestClient.get("#{@base_url}/attendees")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch concerts: #{e.message}" }
  end
end
