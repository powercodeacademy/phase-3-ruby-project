#!/usr/bin/env ruby

# TODO: Build your CLI application here!
#
# Requirements:
# - Be object-oriented (at least two classes)
# - Make HTTP requests to your Sinatra API
# - Parse and display JSON responses
# - Accept user input and use it to send requests
# - Use a loop or menu interface
# - Include current value prompts for updates

require 'rest-client' 
require 'json' 

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

end

class CLIInterface 
  def initialize 
    @api_client = APIClient.new 
  end

  def display_menu 
    puts "\n=== Shopping Tracker CLI ==="
    puts "1. View all receipts"
    puts "q. Quit"
    print "\nEnter your choice: "
  end

  def run 
    puts "Welcome to the Shopping Tracker CLI!" 
    puts "This application connects to your Sinatra API."
    puts "Make sure your API server is running on http://localhost:9292"
    puts 

    loop do 
      display_menu 
      choice = gets.chomp.downcase 

      case choice 
      when '1'
        view_all_receipts 
      when 'q', 'quit', 'exit' 
        puts "Bye!" 
        break 
      else 
        puts "Invalid choice. Please try again."
      end
    end
  end

  private 

  def view_all_receipts 
    puts "\n=== All Receipts ==="
    response = @api_client.get_receipts 

    if response.empty? 
      puts "No receipts found. Try exiting the CLI and running 'bundle exec rake db:seed'."
    else 
      display_receipts(response)
    end

    loop do 
      puts "\n=== Receipt Menu ==="
      puts "a. Filter by store"
      puts "c. Back to main menu"
      print "Enter your choice: "
      option = gets.chomp.downcase 

      case option 
      when 'a'
        filter_receipts_by_store 
      when 'c'
        break 
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  def filter_receipts_by_store 
    print "Enter store name (case sensitive): "
    store_name = gets.chomp 

    response = @api_client.get_receipts_by_store(store_name) 

    if response.empty? 
      puts "No receipts found for store '#{store_name}'."
    else 
      puts "\n=== Receipts for Store: #{store_name} ==="
      display_receipts(response) 
    end
  end

  def display_receipts(receipts)
    receipts.each do |receipt|
        puts "ID: #{receipt['id']}"
        puts "Date: #{receipt['date']}"
        puts "Store: #{receipt['store']['name']}"
        puts "----------"
    end
  end
end

if __FILE__ == $0 
  CLIInterface.new.run 
end
