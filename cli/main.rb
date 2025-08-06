#!/usr/bin/env ruby

require "rest-client"
require "json"
require "pry"

# API Client class to handle HTTP requests
class APIClient
  def initialize(base_url = "http://localhost:9292")
    @base_url = base_url
  end

  def parse_response(response)
    body = response.body.strip
    body.empty? ? {} : JSON.parse(body)
  end

  def get_children
    response = RestClient.get("#{@base_url}/children")
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to fetch children: #{e.message}" }
  end

  def get_child(id)
    response = RestClient.get("#{@base_url}/children/#{id}")
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to fetch child: #{e.message}" }
  end

  def create_child(data)
    response = RestClient.post("#{@base_url}/children", data.to_json, content_type: :json)
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to create child: #{e.message}" }
  end

  def update_child(id, data)
    response = RestClient.patch("#{@base_url}/children/#{id}", data.to_json, content_type: :json)
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to update child: #{e.message}" }
  end

  def delete_child(id)
    response = RestClient.delete("#{@base_url}/children/#{id}")
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to delete child: #{e.message}" }
  end

  def get_entries
    response = RestClient.get("#{@base_url}/entries")
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to fetch entries: #{e.message}" }
  end

  def get_entry(id)
    response = RestClient.get("#{@base_url}/entries/#{id}")
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to fetch entry: #{e.message}" }
  end

  def create_entry(data)
    response = RestClient.post("#{@base_url}/entries", data.to_json, content_type: :json)
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to create entry: #{e.message}" }
  end

  def update_entry(id, data)
    response = RestClient.patch("#{@base_url}/entries/#{id}", data.to_json, content_type: :json)
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to update entry: #{e.message}" }
  end

  def delete_entry(id)
    response = RestClient.delete("#{@base_url}/entries/#{id}")
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to delete entry: #{e.message}" }
  end

  def get_milestones
    response = RestClient.get("#{@base_url}/milestones")
    parse_response(response) unless response.body.strip.empty?
  rescue RestClient::Exception => e
    { error: "Failed to fetch milestones: #{e.message}" }
  end

  def create_milestone(data)
    response = RestClient.post("#{@base_url}/milestones", data.to_json, content_type: :json)
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to create milestone: #{e.message}" }
  end

  def update_milestone(id, data)
    response = RestClient.patch("#{@base_url}/milestones/#{id}", data.to_json, content_type: :json)
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to update milestone: #{e.message}" }
  end

  def delete_milestone(id)
    response = RestClient.delete("#{@base_url}/milestones/#{id}")
    parse_response(response)
  rescue RestClient::Exception => e
    { error: "Failed to delete milestone: #{e.message}" }
  end
end

# CLI Interface class to handle user interaction
class CLIInterface
  def initialize
    @api_client = APIClient.new
  end

  def display_menu
    puts "\n=== LittleByLittle CLI ==="
    puts "Log your child's milestones!"
    puts "1. View all children"
    puts "2. View all entries"
    puts "3. View all milestones"
    puts "4. Create a new child user"
    puts "5. Create a new entry"
    puts "6. Create a new milestone"
    puts "7. Update a child"
    puts "8. Update an entry"
    puts "9. Update a milestone"
    puts "10. Delete a child"
    puts "11. Delete an entry"
    puts "12. Delete a milestone"
    puts "13. View entries for a specific child"           # GET /children/:id/entries
    puts "14. View milestones for a specific child"        # GET /children/:child_id/milestones
    puts "15. View entries for a specific milestone"
    puts "q. Quit"
    print "\nEnter your choice: "
  end

  def run
    puts "Welcome to LittleByLittle CLI!"
    puts "This application connects to your Sinatra API."
    puts "Make sure your API server is running on http://localhost:9292"
    puts

    loop do
      display_menu
      choice = gets.chomp.downcase

      case choice
      when "1"
        view_all_children
      when "2"
        view_all_entries
      when "3"
        view_all_milestones
      when "4"
        create_child
      when "5"
        create_entry
      when "6"
        create_milestone
      when "7"
        puts "7"
      when "8"
        puts "8"
      when "9"
        puts "9"
      when "10"
        puts "10"
      when "11"
        puts "11"
      when "12"
        puts "12"
      when "13"
        puts "13"
      when "14"
        puts "14"
      when "15"
        puts "15"
      when "q", "quit", "exit"
        puts "Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  private

  def view_all_children
    puts "\n=== All Children ==="
    response = @api_client.get_children

    if response.is_a?(Array)
      if response.empty?
        puts "No children found."
      else
        response.each do |child|
          display_child(child)
          puts "-" * 50
        end
      end
    else
      puts "Error: #{response[:error]}"
    end
  end

  def view_all_entries
    puts "\n=== All Entries ==="
    response = @api_client.get_entries

    if response.is_a?(Array)
      if response.empty?
        puts "No entries found."
      else
        response.each do |entry|
          display_entry(entry)
          puts "-" * 50
        end
      end
    else
      puts "Error: #{response[:error]}"
    end
  end

  def view_all_milestones
    puts "\n=== All Milestones ==="
    response = @api_client.get_milestones

    if response.is_a?(Array)
      if response.empty?
        puts "No milestones found."
      else
        response.each do |milestone|
          display_milestone(milestone)
          puts "-" * 50
        end
      end
    else
      puts "Error: #{response[:error]}"
    end
  end

  def create_child
    puts "\n=== Create New Child ==="

    print "Name: "
    name = gets.chomp

    print "Birthdate (YYYY-MM-DD): "
    birthdate = gets.chomp

    data = { name: name, birthdate: birthdate }

    response = @api_client.create_child(data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Child created successfully!"
      display_child(response)
    end
  end

  def create_entry
    puts "\n=== Create New Entry ==="

    children_response = @api_client.get_children
    if children_response.is_a?(Array) && !children_response.empty?
      puts "\n Available children:"
      children_response.each { |child| puts "#{child['id']}. #{child['name']}" }
    else
      puts "No children available. Please create a child first."
      return
    end

    print "Child ID: "
    child_id = gets.chomp.to_i

    milestones_response = @api_client.get_milestones
    if milestones_response.is_a?(Array) && !milestones_response.empty?
      puts "\n Available milestones:"
      milestones_response.each do |milestone|
        puts "#{milestone['id']}. #{milestone['title']}. | #{milestone['milestone_type']}"
      end
    else
      puts "No milestones available. Please create a milestone first."
      return
    end

    print "Milestone ID: "
    milestone_id = gets.chomp.to_i

    print "Date: "
    date = gets.chomp

    print "Age (Months): "
    age_months = gets.chomp.to_i

    print "Note: "
    note = gets.chomp

    data = { date: date, age: age_months, note: note, child_id: child_id,
             milestone_id: milestone_id, }

    response = @api_client.create_entry(data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Entry created successfully!"
      display_entry(response)
    end
  end

  def create_milestone
    puts "\n=== Create New Milestone ==="

    print "Milestone Title: "
    title = gets.chomp

    print "Milestone Type: "
    milestone_type = gets.chomp

    data = { title: title, milestone_type: milestone_type }

    response = @api_client.create_milestone(data)

    if response[:error]
      puts "Error: #{response[:error]}"
    else
      puts "Milestone created successfully!"
      display_milestone(response)
    end
  end

  #   def update_owner
  #     view_all_owners
  #     print "\nEnter the ID of the owner to update: "
  #     id = gets.chomp.to_i

  #     # Get current owner data
  #     current_owner = @api_client.get_owner(id)
  #     if current_owner[:error]
  #       puts "Error: #{current_owner[:error]}"
  #       return
  #     end

  #     puts "\nCurrent owner data:"
  #     display_owner(current_owner)

  #     puts "\nEnter new values (press Enter to keep current value):"

  #     print "Name (#{current_owner['name']}): "
  #     name = gets.chomp
  #     name = current_owner["name"] if name.empty?

  #     print "Email (#{current_owner['email']}): "
  #     email = gets.chomp
  #     email = current_owner["email"] if email.empty?

  #     print "Phone (#{current_owner['phone']}): "
  #     phone = gets.chomp
  #     phone = current_owner["phone"] if phone.empty?

  #     print "Address (#{current_owner['address'] || 'none'}): "
  #     address = gets.chomp
  #     address = current_owner["address"] if address.empty?

  #     data = { name: name, email: email, phone: phone, address: address }

  #     response = @api_client.update_owner(id, data)

  #     if response[:error]
  #       puts "Error: #{response[:error]}"
  #     else
  #       puts "Owner updated successfully!"
  #       display_owner(response)
  #     end
  #   end

  #   def update_pet
  #     view_all_pets
  #     print "\nEnter the ID of the pet to update: "
  #     id = gets.chomp.to_i

  #     # Get current pet data
  #     current_pet = @api_client.get_pet(id)
  #     if current_pet[:error]
  #       puts "Error: #{current_pet[:error]}"
  #       return
  #     end

  #     puts "\nCurrent pet data:"
  #     display_pet(current_pet)

  #     puts "\nEnter new values (press Enter to keep current value):"

  #     print "Name (#{current_pet['name']}): "
  #     name = gets.chomp
  #     name = current_pet["name"] if name.empty?

  #     print "Species (#{current_pet['species']}): "
  #     species = gets.chomp
  #     species = current_pet["species"] if species.empty?

  #     print "Breed (#{current_pet['breed']}): "
  #     breed = gets.chomp
  #     breed = current_pet["breed"] if breed.empty?

  #     print "Age (#{current_pet['age']}): "
  #     age_input = gets.chomp
  #     age = age_input.empty? ? current_pet["age"] : age_input.to_i

  #     print "Notes (#{current_pet['notes'] || 'none'}): "
  #     notes = gets.chomp
  #     notes = current_pet["notes"] if notes.empty?

  #     data = { name: name, species: species, breed: breed, age: age, notes: notes }

  #     response = @api_client.update_pet(id, data)

  #     if response[:error]
  #       puts "Error: #{response[:error]}"
  #     else
  #       puts "Pet updated successfully!"
  #       display_pet(response)
  #     end
  #   end

  #   def delete_owner
  #     view_all_owners
  #     print "\nEnter the ID of the owner to delete: "
  #     id = gets.chomp.to_i

  #     print "Are you sure you want to delete this owner? (y/n): "
  #     confirmation = gets.chomp.downcase

  #     if %w[y yes].include?(confirmation)
  #       response = @api_client.delete_owner(id)

  #       if response[:error]
  #         puts "Error: #{response[:error]}"
  #       else
  #         puts "Owner deleted successfully!"
  #       end
  #     else
  #       puts "Deletion cancelled."
  #     end
  #   end

  #   def delete_pet
  #     view_all_pets
  #     print "\nEnter the ID of the pet to delete: "
  #     id = gets.chomp.to_i

  #     print "Are you sure you want to delete this pet? (y/n): "
  #     confirmation = gets.chomp.downcase

  #     if %w[y yes].include?(confirmation)
  #       response = @api_client.delete_pet(id)

  #       if response[:error]
  #         puts "Error: #{response[:error]}"
  #       else
  #         puts "Pet deleted successfully!"
  #       end
  #     else
  #       puts "Deletion cancelled."
  #     end
  #   end

  #   def view_pets_by_owner
  #     view_all_owners
  #     print "\nEnter the owner ID to view their pets: "
  #     owner_id = gets.chomp.to_i

  #     response = @api_client.get_owner_pets(owner_id)

  #     if response.is_a?(Array)
  #       if response.empty?
  #         puts "This owner has no pets."
  #       else
  #         puts "\n=== Pets for this owner ==="
  #         response.each do |pet|
  #           display_pet(pet)
  #           puts "-" * 50
  #         end
  #       end
  #     else
  #       puts "Error: #{response[:error]}"
  #     end
  #   end

  def display_child(child)
    puts "ID: #{child['id']}"
    puts "Name: #{child['name']}"
    puts "Birthdate: #{child['birthdate']}"

    if child["entries"] && !child["entries"].empty?
      puts "Entries:"
      child["entries"].each { |entry| puts "  - #{entry['date']} (#{entry['note']})" }
    else
      puts "Entries: None"
    end
  end

  def display_entry(entry)
    puts "ID: #{entry['id']}"
    puts "Date: #{entry['date']}"
    puts "Note: #{entry['note']}"
    puts "Age: #{entry['age_months']}"

    return unless entry["child"]

    puts "Child: #{entry['child']['name']} (ID: #{entry['child']['id']})"

  end

  def display_milestone(milestone)
    puts "ID: #{milestone['id']}"
    puts "Title: #{milestone['title']}"
    puts "Type: #{milestone['milestone_type']}"

    nil
  end
end

# Run the CLI application
CLIInterface.new.run if __FILE__ == $0
