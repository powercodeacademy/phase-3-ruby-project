Bnb.destroy_all
GuestLogEntry.destroy_all
Guest.destroy_all
Stay.destroy_all

puts "creating bnbs.."
bnb1 = Bnb.create(name: "Sunshine Retreat", location: "Charlottesville, VA", num_of_rooms: 5,
                  cost_per_night: 120, description: "A cozy retreat in the heart of Charlottesville.")
bnb2 = Bnb.create(name: "Mountain View Inn", location: "Asheville, NC", num_of_rooms: 8,
                  cost_per_night: 150, description: "Beautiful views of the mountains.")
bnb3 = Bnb.create(name: "Seaside Escape", location: "Virginia Beach, VA", num_of_rooms: 10,
                  cost_per_night: 200, description: "Relaxing seaside getaway.")
bnb4 = Bnb.create(name: "Urban Oasis", location: "Richmond, VA", num_of_rooms: 6,
                  cost_per_night: 180, description: "Modern accommodations in the city.")
bnb5 = Bnb.create(name: "Countryside B&B", location: "Charlottesville, VA", num_of_rooms: 4,
                  cost_per_night: 130, description: "Peaceful countryside stay.")
bnb6 = Bnb.create(name: "Lake House Lodge", location: "Lake Tahoe, CA", num_of_rooms: 7,
                  cost_per_night: 220, description: "Scenic views by the lake.")

puts "creating guests.."
guest1 = Guest.create(name: "John Doe", age: 34)
guest2 = Guest.create(name: "Jane Smith", age: 28)
guest3 = Guest.create(name: "Alice Johnson", age: 45)
guest4 = Guest.create(name: "Bob Brown", age: 39)
guest5 = Guest.create(name: "Charlie Davis", age: 52)
guest6 = Guest.create(name: "Emily Evans", age: 31)

puts "creating stays.."
stay1 = Stay.create(bnb_id: bnb1.id, guest_id: guest1.id, check_in: "2024-07-01",
                    check_out: "2024-07-05")
stay2 = Stay.create(bnb_id: bnb2.id, guest_id: guest2.id, check_in: "2024-07-10",
                    check_out: "2024-07-15")
stay3 = Stay.create(bnb_id: bnb3.id, guest_id: guest3.id, check_in: "2024-07-20",
                    check_out: "2024-07-25")
stay4 = Stay.create(bnb_id: bnb4.id, guest_id: guest4.id, check_in: "2024-08-01",
                    check_out: "2024-08-05")
stay5 = Stay.create(bnb_id: bnb5.id, guest_id: guest5.id, check_in: "2024-08-10",
                    check_out: "2024-08-15")
stay6 = Stay.create(bnb_id: bnb6.id, guest_id: guest6.id, check_in: "2024-08-20",
                    check_out: "2024-08-25")
stay7 = Stay.create(bnb_id: bnb1.id, guest_id: guest6.id, check_in: "2024-08-20",
                    check_out: "2024-08-25")
stay8 = Stay.create(bnb_id: bnb1.id, guest_id: guest6.id, check_in: "2024-08-20",
                    check_out: "2024-08-25")
stay5 = Stay.create(bnb_id: bnb5.id, guest_id: guest3.id, check_in: "2024-11-10",
                    check_out: "2024-11-15")

puts "creating guest log entries.."
GuestLogEntry.create(
  bnb_id: bnb1.id,
  guest_id: guest1.id,
  stay_id: stay1.id,
  message: "Had a wonderful stay at Sunshine Retreat!",
  entry_date: Date.new(2023, rand(1..12), rand(1..28))
)
GuestLogEntry.create(
  bnb_id: bnb2.id,
  guest_id: guest2.id,
  stay_id: stay2.id,
  message: "Loved the mountain views at Mountain View Inn.",
  entry_date: Date.new(2023, rand(1..12), rand(1..28))
)
GuestLogEntry.create(
  bnb_id: bnb3.id,
  guest_id: guest3.id,
  stay_id: stay3.id,
  message: "Enjoyed the beach at Seaside Escape.",
  entry_date: Date.new(2023, rand(1..12), rand(1..28))
)
GuestLogEntry.create(
  bnb_id: bnb4.id,
  guest_id: guest4.id,
  stay_id: stay4.id,
  message: "Great city location at Urban Oasis.",
  entry_date: Date.new(2023, rand(1..12), rand(1..28))
)
GuestLogEntry.create(
  bnb_id: bnb5.id,
  guest_id: guest5.id,
  stay_id: stay5.id,
  message: "Peaceful and quiet at Countryside B&B.",
  entry_date: Date.new(2023, rand(1..12), rand(1..28))
)
GuestLogEntry.create(
  bnb_id: bnb6.id,
  guest_id: guest6.id,
  stay_id: stay6.id,
  message: "Beautiful lake view at Lake House Lodge.",
  entry_date: Date.new(2023, rand(1..12), rand(1..28))
)
GuestLogEntry.create(
  bnb_id: bnb1.id,
  guest_id: guest2.id,
  stay_id: stay7.id,
  message: "BEST BREAKFAST.",
  entry_date: Date.new(2023, rand(1..12), rand(1..28))
)
GuestLogEntry.create(
  bnb_id: bnb1.id,
  guest_id: guest6.id,
  stay_id: stay8.id,
  message: "Great linens",
  entry_date: Date.new(2023, rand(1..12), rand(1..28))
)
