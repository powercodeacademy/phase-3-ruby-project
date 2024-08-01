Run.destroy_all
Shoe.destroy_all
Runner.destroy_all

puts "🌱 Seeding..."

runners = [
  Runner.create(name: "Jamal Johnson"),
  Runner.create(name: "Aaliyah Williams"),
  Runner.create(name: "Malik Brown"),
  Runner.create(name: "Imani Robinson"),
  Runner.create(name: "Darius Washington"),
]

shoes = [
  Shoe.create(name: "Nike Air Zoom", runner: runners[0]),
  Shoe.create(name: "Adidas UltraBoost", runner: runners[0]),
  Shoe.create(name: "New Balance 1080", runner: runners[1]),
  Shoe.create(name: "ASICS Gel Kayano", runner: runners[2]),
  Shoe.create(name: "Brooks Ghost", runner: runners[3]),
  Shoe.create(name: "Saucony Kinvara", runner: runners[4]),
]

def random_run_attributes(runner, shoe)
  {
    distance: rand(1..20),
    cadence: rand(150..200),
    average_heart_rate: rand(120..180),
    average_pace: rand(4.0..10.0).round(2),
    calories_burned: rand(200..1500),
    total_time_minutes: rand(30..180),
    runner: runner,
    shoe: shoe,
  }
end

Run.create(random_run_attributes(runners[0], shoes[0]))
Run.create(random_run_attributes(runners[0], shoes[1]))
Run.create(random_run_attributes(runners[1], shoes[2]))
Run.create(random_run_attributes(runners[2], shoes[3]))
Run.create(random_run_attributes(runners[2], shoes[3]))
Run.create(random_run_attributes(runners[3], shoes[4]))
Run.create(random_run_attributes(runners[4], shoes[5]))

puts "...Seeding Complete 🌱 "
