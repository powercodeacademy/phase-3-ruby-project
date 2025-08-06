require 'json' 
require 'rest-client' 

class APIClient 
  def initialize(base_url = "http://localhost:9292/")
    @base_url = base_url 
  end

  def get_receipts
    response = RestClient.get(@base_url + "receipts")
    JSON.parse(response.body)
  rescue RestClient::Exception => e 
    { error: "Failed to fetch receipts: #{e.message}" }
  end

  def get_receipts_by_store(store)
    response = RestClient.get(@base_url + "receipts", { params: { store: store } })
    JSON.parse(response.body)
  rescue RestClient::Exception => e 
    { error: "Failed to fetch receipts by store: #{e.message}" }
  end

  def get_receipt_by_id(id)
    response = RestClient.get(@base_url + "receipts/" + id.to_s)
    JSON.parse(response.body)
  rescue RestClient::Exception => e 
    { error: "Failed to fetch receipt with ID #{id}: #{e.message}"}
  end

  def get_receipt_id_by_item(item_id)
    response = RestClient.get(@base_url + "items/" + item_id)
    JSON.parse(response.body)['receipt_id']
  end

  def get_items 
    response = RestClient.get(@base_url + "items")
    JSON.parse(response.body)
  rescue RestClient::Exception => e 
    { error: "Failed to fetch items: #{e.message}" }
  end

  def get_items_by_store(store)
    response = RestClient.get(@base_url + "items", { params: { store: store } })
    JSON.parse(response.body)
  rescue RestClient::Exception => e 
    { error: "Failed to fetch items by store: #{e.message}" }
  end

end
