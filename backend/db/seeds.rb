Run.destroy_all
Shoe.destroy_all
Runner.destroy_all

puts "🌱 Seeding..."

runner1 = Runner.create(name: 'John Doe')
runner2 = Runner.create(name: 'Jane Smith')
runner3 = Runner.create(name: 'Alice Johnson')

shoe1 = Shoe.create(name: 'Nike Air Zoom', mileage: 50, runner: runner1)
shoe2 = Shoe.create(name: 'Adidas UltraBoost', mileage: 75, runner: runner1)
shoe3 = Shoe.create(name: 'New Balance 1080', mileage: 100, runner: runner2)
shoe4 = Shoe.create(name: 'ASICS Gel Kayano', mileage: 25, runner: runner3)

Run.create(distance: 5, runner: runner1, shoe: shoe1)
Run.create(distance: 10, runner: runner1, shoe: shoe2)
Run.create(distance: 7, runner: runner2, shoe: shoe3)
Run.create(distance: 3, runner: runner3, shoe: shoe4)
Run.create(distance: 8, runner: runner3, shoe: shoe4)

puts "✅ Done seeding!"
