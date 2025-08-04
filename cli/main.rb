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

# !/usr/bin/env ruby

require "rest-client"
require "json"

# API Client class to handle HTTP requests
class APIClient
  def initialize(base_url = "http://localhost:9292")
    @base_url = base_url
  end

  # def get_owners
  #   response = RestClient.get("#{@base_url}/owners")
  #   JSON.parse(response.body)
  # rescue RestClient::Exception => e
  #   { error: "Failed to fetch owners: #{e.message}" }
  # end
end

# CLI Interface class to handle user interaction
class CLIInterface
  def initialize
    @api_client = APIClient.new
  end

  def display_menu
    puts "\n=== Pet Tracker CLI ==="
    puts "1. View all owners"
    puts "2. View all pets"
    puts "3. Create a new owner"
    puts "4. Create a new pet"
    puts "5. Update an owner"
    puts "6. Update a pet"
    puts "7. Delete an owner"
    puts "8. Delete a pet"
    puts "9. View pets by owner"
    puts "q. Quit"
    print "\nEnter your choice: "
  end

  def run
    puts "Welcome to your CLI Application!"
    puts "This application connects to your Sinatra API."
    puts "Make sure your API server is running on http://localhost:9292"
    puts

    loop do
      display_menu
      choice = gets.chomp.downcase

      case choice
      when "1"
        view_all_owners
      when "2"
        view_all_pets
      when "3"
        create_owner
      when "4"
        create_pet
      when "5"
        update_owner
      when "6"
        update_pet
      when "7"
        delete_owner
      when "8"
        delete_pet
      when "9"
        view_pets_by_owner
      when "q", "quit", "exit"
        puts "Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  private
end

# Run the CLI application
CLIInterface.new.run if __FILE__ == $PROGRAM_NAME
