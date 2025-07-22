#!/usr/bin/env ruby

require 'rest-client'
require 'json'

# API Client class to handle HTTP requests
class APIClient
  def initialize(base_url = 'http://localhost:9293')
    @base_url = base_url
  end

  def get_owners
    response = RestClient.get("#{@base_url}/owners")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch owners: #{e.message}" }
  end

  def get_owner(id)
    response = RestClient.get("#{@base_url}/owners/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch owner: #{e.message}" }
  end

  def create_owner(data)
    response = RestClient.post("#{@base_url}/owners", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to create owner: #{e.message}" }
  end

  def update_owner(id, data)
    response = RestClient.patch("#{@base_url}/owners/#{id}", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to update owner: #{e.message}" }
  end

  def delete_owner(id)
    response = RestClient.delete("#{@base_url}/owners/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to delete owner: #{e.message}" }
  end

  def get_pets
    response = RestClient.get("#{@base_url}/pets")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch pets: #{e.message}" }
  end

  def get_pet(id)
    response = RestClient.get("#{@base_url}/pets/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch pet: #{e.message}" }
  end

  def create_pet(data)
    response = RestClient.post("#{@base_url}/pets", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to create pet: #{e.message}" }
  end

  def update_pet(id, data)
    response = RestClient.patch("#{@base_url}/pets/#{id}", data.to_json, content_type: :json)
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to update pet: #{e.message}" }
  end

  def delete_pet(id)
    response = RestClient.delete("#{@base_url}/pets/#{id}")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to delete pet: #{e.message}" }
  end

  def get_owner_pets(owner_id)
    response = RestClient.get("#{@base_url}/owners/#{owner_id}/pets")
    JSON.parse(response.body)
  rescue RestClient::Exception => e
    { error: "Failed to fetch owner's pets: #{e.message}" }
  end
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
    puts "Welcome to the Pet Tracker CLI!"
    puts "This application connects to your Sinatra API."
    puts "Make sure your API server is running on http://localhost:9293"
    puts

    loop do
      display_menu
      choice = gets.chomp.downcase

      case choice
      when '1'
        view_all_owners
      when '2'
        view_all_pets
      when '3'
        create_owner
      when '4'
        create_pet
      when '5'
        update_owner
      when '6'
        update_pet
      when '7'
        delete_owner
      when '8'
        delete_pet
      when '9'
        view_pets_by_owner
      when 'q', 'quit', 'exit'
        puts "Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  private

  def view_all_owners
    puts "\n=== All Owners ==="
    response = @api_client.get_owners

    if response.is_a?(Array)
      if response.empty?
        puts "No owners found."
      else
        response.each do |owner|
          display_owner(owner)
          puts "-" * 50
        end
      end
    else
      puts "Error: #{response[:error]}"
    end
  end

  def view_all_pets
    puts "\n=== All Pets ==="
    response = @api_client.get_pets

    if response.is_a?(Array)
      if response.empty?
        puts "No pets found."
      else
        response.each do |pet|
          display_pet(pet)
          puts "-" * 50
        end
      end
    else
      puts "Error: #{response[:error]}"
    end
  end

  def create_owner
    puts "\n=== Create New Owner ==="

    print "Name: "
    name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Phone: "
    phone = gets.chomp

    print "Address (optional): "
    address = gets.chomp

    data = { name: name, email: email, phone: phone }
    data[:address] = address unless address.empty?

    response = @api_client.create_owner(data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Owner created successfully!"
      display_owner(response)
    end
  end

  def create_pet
    puts "\n=== Create New Pet ==="

    # First, show available owners
    owners_response = @api_client.get_owners
    if owners_response.is_a?(Array) && !owners_response.empty?
      puts "Available owners:"
      owners_response.each { |owner| puts "#{owner['id']}. #{owner['name']}" }
    else
      puts "No owners available. Please create an owner first."
      return
    end

    print "Owner ID: "
    owner_id = gets.chomp.to_i

    print "Name: "
    name = gets.chomp

    print "Species: "
    species = gets.chomp

    print "Breed: "
    breed = gets.chomp

    print "Age: "
    age = gets.chomp.to_i

    print "Notes (optional): "
    notes = gets.chomp

    data = { name: name, species: species, breed: breed, age: age, owner_id: owner_id }
    data[:notes] = notes unless notes.empty?

    response = @api_client.create_pet(data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Pet created successfully!"
      display_pet(response)
    end
  end

  def update_owner
    view_all_owners
    print "\nEnter the ID of the owner to update: "
    id = gets.chomp.to_i

    # Get current owner data
    current_owner = @api_client.get_owner(id)
    if current_owner[:error]
      puts "Error: #{current_owner[:error]}"
      return
    end

    puts "\nCurrent owner data:"
    display_owner(current_owner)

    puts "\nEnter new values (press Enter to keep current value):"

    print "Name (#{current_owner['name']}): "
    name = gets.chomp
    name = current_owner['name'] if name.empty?

    print "Email (#{current_owner['email']}): "
    email = gets.chomp
    email = current_owner['email'] if email.empty?

    print "Phone (#{current_owner['phone']}): "
    phone = gets.chomp
    phone = current_owner['phone'] if phone.empty?

    print "Address (#{current_owner['address'] || 'none'}): "
    address = gets.chomp
    address = current_owner['address'] if address.empty?

    data = { name: name, email: email, phone: phone, address: address }

    response = @api_client.update_owner(id, data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Owner updated successfully!"
      display_owner(response)
    end
  end

  def update_pet
    view_all_pets
    print "\nEnter the ID of the pet to update: "
    id = gets.chomp.to_i

    # Get current pet data
    current_pet = @api_client.get_pet(id)
    if current_pet[:error]
      puts "Error: #{current_pet[:error]}"
      return
    end

    puts "\nCurrent pet data:"
    display_pet(current_pet)

    puts "\nEnter new values (press Enter to keep current value):"

    print "Name (#{current_pet['name']}): "
    name = gets.chomp
    name = current_pet['name'] if name.empty?

    print "Species (#{current_pet['species']}): "
    species = gets.chomp
    species = current_pet['species'] if species.empty?

    print "Breed (#{current_pet['breed']}): "
    breed = gets.chomp
    breed = current_pet['breed'] if breed.empty?

    print "Age (#{current_pet['age']}): "
    age_input = gets.chomp
    age = age_input.empty? ? current_pet['age'] : age_input.to_i

    print "Notes (#{current_pet['notes'] || 'none'}): "
    notes = gets.chomp
    notes = current_pet['notes'] if notes.empty?

    data = { name: name, species: species, breed: breed, age: age, notes: notes }

    response = @api_client.update_pet(id, data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Pet updated successfully!"
      display_pet(response)
    end
  end

  def delete_owner
    view_all_owners
    print "\nEnter the ID of the owner to delete: "
    id = gets.chomp.to_i

    print "Are you sure you want to delete this owner? (y/n): "
    confirmation = gets.chomp.downcase

    if confirmation == 'y' || confirmation == 'yes'
      response = @api_client.delete_owner(id)

      if response[:error]
        puts "Error: #{response[:error]}"
      else
        puts "Owner deleted successfully!"
      end
    else
      puts "Deletion cancelled."
    end
  end

  def delete_pet
    view_all_pets
    print "\nEnter the ID of the pet to delete: "
    id = gets.chomp.to_i

    print "Are you sure you want to delete this pet? (y/n): "
    confirmation = gets.chomp.downcase

    if confirmation == 'y' || confirmation == 'yes'
      response = @api_client.delete_pet(id)

      if response[:error]
        puts "Error: #{response[:error]}"
      else
        puts "Pet deleted successfully!"
      end
    else
      puts "Deletion cancelled."
    end
  end

  def view_pets_by_owner
    view_all_owners
    print "\nEnter the owner ID to view their pets: "
    owner_id = gets.chomp.to_i

    response = @api_client.get_owner_pets(owner_id)

    if response.is_a?(Array)
      if response.empty?
        puts "This owner has no pets."
      else
        puts "\n=== Pets for this owner ==="
        response.each do |pet|
          display_pet(pet)
          puts "-" * 50
        end
      end
    else
      puts "Error: #{response[:error]}"
    end
  end

  def display_owner(owner)
    puts "ID: #{owner['id']}"
    puts "Name: #{owner['name']}"
    puts "Email: #{owner['email']}"
    puts "Phone: #{owner['phone']}"
    puts "Address: #{owner['address'] || 'Not provided'}"

    if owner['pets'] && !owner['pets'].empty?
      puts "Pets:"
      owner['pets'].each { |pet| puts "  - #{pet['name']} (#{pet['species']})" }
    else
      puts "Pets: None"
    end
  end

  def display_pet(pet)
    puts "ID: #{pet['id']}"
    puts "Name: #{pet['name']}"
    puts "Species: #{pet['species']}"
    puts "Breed: #{pet['breed']}"
    puts "Age: #{pet['age']} years"
    puts "Notes: #{pet['notes'] || 'None'}"

    if pet['owner']
      puts "Owner: #{pet['owner']['name']} (ID: #{pet['owner']['id']})"
    end
  end
end

# Run the CLI application
if __FILE__ == $0
  CLIInterface.new.run
end
