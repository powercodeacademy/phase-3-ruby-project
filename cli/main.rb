require "rest-client"
require "json"
require_relative "api_client"

# CLI Interface class to handle user interaction
class CLIInterface
  def initialize
    @api_client = APIClient.new
  end

  def run
    puts "Welcome to the Pet Tracker CLI!"
    puts "This application connects to your Sinatra API."
    puts "Make sure your API server is running on http://localhost:9292"
  end
end

CLIInterface.new.run if __FILE__ == $0
