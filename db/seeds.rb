# frozen_string_literal: true

puts "🌱 Seeding spices..."

# Clear existing data
Pet.destroy_all
Owner.destroy_all

# Create owners
owner1 = Owner.create!(
  name: "Sarah Johnson",
  email: "sarah.johnson@email.com",
  phone: "555-0101",
  address: "123 Main St, Anytown, USA"
)

owner2 = Owner.create!(
  name: "Mike Chen",
  email: "mike.chen@email.com",
  phone: "555-0102",
  address: "456 Oak Ave, Somewhere, USA"
)

owner3 = Owner.create!(
  name: "Emily Rodriguez",
  email: "emily.rodriguez@email.com",
  phone: "555-0103",
  address: "789 Pine Rd, Elsewhere, USA"
)

# Create pets
Pet.create!(
  name: "Buddy",
  species: "Dog",
  breed: "Golden Retriever",
  age: 3,
  notes: "Loves playing fetch and swimming",
  owner: owner1
)

Pet.create!(
  name: "Whiskers",
  species: "Cat",
  breed: "Siamese",
  age: 5,
  notes: "Very vocal and affectionate",
  owner: owner1
)

Pet.create!(
  name: "Rex",
  species: "Dog",
  breed: "German Shepherd",
  age: 2,
  notes: "Great guard dog, loves training",
  owner: owner2
)

Pet.create!(
  name: "Luna",
  species: "Cat",
  breed: "Persian",
  age: 4,
  notes: "Loves sunny spots and grooming",
  owner: owner3
)

Pet.create!(
  name: "Charlie",
  species: "Dog",
  breed: "Labrador Retriever",
  age: 1,
  notes: "Very energetic puppy, loves everyone",
  owner: owner3
)

puts "Seed data created successfully!"
puts "Created #{Owner.count} owners and #{Pet.count} pets"

puts "✅ Done seeding!"
