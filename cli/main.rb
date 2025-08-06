require "rest-client"
require "json"
require_relative "api_client"

# CLI Interface class to handle user interaction
class CLIInterface
  def initialize
    @api_client = APIClient.new
  end

  def display_menu
    puts "\n=== Concert Tracker CLI ==="
    puts "1. View all concerts"
    puts "2. View all attendees"
    puts "3. Create a new concert"
    puts "4. Create a new attendee"
    puts "5. Update a concert"
    puts "6. Update an attendee"
    puts "7. Delete a concert"
    puts "8. Delete an attendee"
    puts "9. View all an attendee's concerts"
    puts "10. View all a concert's attendees"
    puts "11. Add a concert to an attendee"
    puts "q. Quit"
    print "\nEnter your choice: "
  end

  def run
    puts "Welcome to the Pet Tracker CLI!"
    puts "This application connects to your Sinatra API."
    puts "Make sure your API server is running on http://localhost:9292"
    puts

    loop do
      display_menu
      choice = gets.chomp.downcase

      case choice
      when "1"
        concerts = @api_client.view_all_concerts
        display_concerts(concerts)
      when "2"
        attendees = @api_client.view_all_attendees
        display_attendees(attendees)
      when "3"
        create_concert
      when "4"
        create_attendee
      when "5"
        update_concert
      when "6"
        update_attendee
      when "7"
        delete_concert
      when "8"
        delete_attendee
      when "9"
        view_attendees_concerts
      when "10"
        view_concerts_attendees
      when "11"
        add_attendee_concert
      when "q", "quit", "exit"
        puts "Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  private

  def display_concerts(concerts)
    concerts.each do |concert|
      puts "#{concert['band_name']} - #{concert['event_date']} @ #{concert['venue']}, #{concert['city']}"
    end
  end

  def display_attendees(attendees)
    attendees.each do |attendee|
      puts "#{attendee['name']}"
    end
  end
end

CLIInterface.new.run if __FILE__ == $0
