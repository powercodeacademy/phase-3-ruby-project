#!/usr/bin/env ruby

require_relative "../config/environment"

class PetTracker
  def initialize
    # No setup needed — Active Record connects directly to the database
  end

  def display_menu
    puts "\n=== Pet Tracker ==="
    puts "1. View all owners"
    puts "2. View all pets"
    puts "3. Add a new owner"
    puts "4. Add a new pet"
    puts "5. Update an owner"
    puts "6. Update a pet"
    puts "7. Delete an owner"
    puts "8. Delete a pet"
    puts "9. View pets by owner"
    puts "q. Quit"
    print "\nEnter your choice: "
  end

  def run
    puts "Welcome to Pet Tracker!"
    puts

    loop do
      display_menu
      choice = gets.chomp.downcase

      case choice
      when "1" then view_all_owners
      when "2" then view_all_pets
      when "3" then create_owner
      when "4" then create_pet
      when "5" then update_owner
      when "6" then update_pet
      when "7" then delete_owner
      when "8" then delete_pet
      when "9" then view_pets_by_owner
      when "q", "quit", "exit"
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
    owners = Owner.all.include(:pets)

    if owners.empty?
      puts "No owners found."
    else
      owners.each do |owner|
        display_owner(owner)
        puts "-" * 50
      end
    end
  end

  def view_all_pets
    puts "\n=== All Pets ==="
    pets = Pet.all.include(:owner)

    if pets.empty?
      puts "No pets found."
    else
      pets.each do |pet|
        display_pet(pet)
        puts "-" * 50
      end
    end
  end

  def create_owner
    puts "\n=== Add New Owner ==="

    print "Name: "
    name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Phone: "
    phone = gets.chomp

    print "Address (optional, press Enter to skip): "
    address = gets.chomp

    owner = Owner.new(name: name, email: email, phone: phone)
    owner.address = address unless address.empty?

    if owner.save
      puts "\nOwner created successfully!"
      display_owner(owner)
    else
      puts "\nCould not create owner:"
      owner.errors.full_messages.each { |msg| puts "  - #{msg}" }
    end
  end

  def create_pet
    puts "\n=== Add New Pet ==="

    owners = Owner.all
    if owners.empty?
      puts "No owners found. Please add an owner first."
      return
    end

    puts "Available owners:"
    owners.each { |o| puts "  #{o.id}. #{o.name}" }
    print "Owner ID: "
    owner_id = gets.chomp.to_i

    owner = Owner.find_by(id: owner_id)
    unless owner
      puts "Owner not found."
      return
    end

    print "Pet name: "
    name = gets.chomp

    print "Species: "
    species = gets.chomp

    print "Breed: "
    breed = gets.chomp

    print "Age: "
    age = gets.chomp.to_i

    print "Notes (optional, press Enter to skip): "
    notes = gets.chomp

    pet = Pet.new(name: name, species: species, breed: breed, age: age, owner: owner)
    pet.notes = notes unless notes.empty?

    if pet.save
      puts "\nPet created successfully!"
      display_pet(pet)
    else
      puts "\nCould not create pet:"
      pet.errors.full_messages.each { |msg| puts "  - #{msg}" }
    end
  end

  def update_owner
    view_all_owners
    print "\nEnter the ID of the owner to update: "
    id = gets.chomp.to_i

    owner = Owner.find_by(id: id)
    unless owner
      puts "Owner not found."
      return
    end

    puts "\nPress Enter to keep the current value."

    print "Name (#{owner.name}): "
    name = gets.chomp
    owner.name = name unless name.empty?

    print "Email (#{owner.email}): "
    email = gets.chomp
    owner.email = email unless email.empty?

    print "Phone (#{owner.phone}): "
    phone = gets.chomp
    owner.phone = phone unless phone.empty?

    print "Address (#{owner.address || "none"}): "
    address = gets.chomp
    owner.address = address unless address.empty?

    if owner.save
      puts "\nOwner updated successfully!"
      display_owner(owner)
    else
      puts "\nCould not update owner:"
      owner.errors.full_messages.each { |msg| puts "  - #{msg}" }
    end
  end

  def update_pet
    view_all_pets
    print "\nEnter the ID of the pet to update: "
    id = gets.chomp.to_i

    pet = Pet.find_by(id: id)
    unless pet
      puts "Pet not found."
      return
    end

    puts "\nPress Enter to keep the current value."

    print "Name (#{pet.name}): "
    name = gets.chomp
    pet.name = name unless name.empty?

    print "Species (#{pet.species}): "
    species = gets.chomp
    pet.species = species unless species.empty?

    print "Breed (#{pet.breed}): "
    breed = gets.chomp
    pet.breed = breed unless breed.empty?

    print "Age (#{pet.age}): "
    age = gets.chomp
    pet.age = age.to_i unless age.empty?

    print "Notes (#{pet.notes || "none"}): "
    notes = gets.chomp
    pet.notes = notes unless notes.empty?

    if pet.save
      puts "\nPet updated successfully!"
      display_pet(pet)
    else
      puts "\nCould not update pet:"
      pet.errors.full_messages.each { |msg| puts "  - #{msg}" }
    end
  end

  def delete_owner
    view_all_owners
    print "\nEnter the ID of the owner to delete: "
    id = gets.chomp.to_i

    owner = Owner.find_by(id: id)
    unless owner
      puts "Owner not found."
      return
    end

    print "Are you sure you want to delete #{owner.name} and all their pets? (y/n): "
    return puts "Deletion cancelled." unless gets.chomp.downcase == "y"

    owner.destroy
    puts "#{owner.name} has been deleted."
  end

  def delete_pet
    view_all_pets
    print "\nEnter the ID of the pet to delete: "
    id = gets.chomp.to_i

    pet = Pet.find_by(id: id)
    unless pet
      puts "Pet not found."
      return
    end

    print "Are you sure you want to delete #{pet.name}? (y/n): "
    return puts "Deletion cancelled." unless gets.chomp.downcase == "y"

    pet.destroy
    puts "#{pet.name} has been deleted."
  end

  def view_pets_by_owner
    view_all_owners
    print "\nEnter owner ID: "
    id = gets.chomp.to_i

    owner = Owner.find_by(id: id)
    unless owner
      puts "Owner not found."
      return
    end

    puts "\n=== Pets owned by #{owner.name} ==="
    if owner.pets.empty?
      puts "This owner has no pets."
    else
      owner.pets.each do |pet|
        display_pet(pet)
        puts "-" * 50
      end
    end
  end

  def display_owner(owner)
    puts "ID:      #{owner.id}"
    puts "Name:    #{owner.name}"
    puts "Email:   #{owner.email}"
    puts "Phone:   #{owner.phone}"
    puts "Address: #{owner.address || "Not provided"}"
    pets = owner.pets
    if pets.any?
      puts "Pets:    #{pets.map(&:name).join(", ")}"
    else
      puts "Pets:    None"
    end
  end

  def display_pet(pet)
    puts "ID:      #{pet.id}"
    puts "Name:    #{pet.name}"
    puts "Species: #{pet.species}"
    puts "Breed:   #{pet.breed}"
    puts "Age:     #{pet.age} years"
    puts "Notes:   #{pet.notes || "None"}"
    puts "Owner:   #{pet.owner.name}" if pet.owner
  end
end

PetTracker.new.run if __FILE__ == $0
