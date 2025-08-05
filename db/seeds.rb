require "date"

Entry.destroy_all
Milestone.destroy_all
Child.destroy_all

puts "🌱 Seeding Children..."

children = [
  { name: "Avery", birthdate: Date.new(2022, 1, 15) },
  { name: "Kai", birthdate: Date.new(2021, 10, 3) },
  { name: "Zoe", birthdate: Date.new(2023, 5, 20) },
  { name: "Miles", birthdate: Date.new(2020, 8, 25) },
  { name: "Nova", birthdate: Date.new(2022, 12, 9) },
]

child_records = children.map { |attrs| Child.create!(attrs) }

puts "🌱 Seeding Milestones..."

milestone_data = [
  { title: "First Smile", milestone_type: "Social" },
  { title: "First Word", milestone_type: "Language" },
  { title: "First Steps", milestone_type: "Motor" },
  { title: "Slept Through the Night", milestone_type: "Health" },
  { title: "First Tooth", milestone_type: "Developmental" },
  { title: "First Laugh", milestone_type: "Social" },
  { title: "First Solid Food", milestone_type: "Feeding" },
]

milestone_records = []

child_records.each_with_index do |child, i|
  milestone = Milestone.create!(
    title: milestone_data[i % milestone_data.length][:title],
    milestone_type: milestone_data[i % milestone_data.length][:milestone_type],
    child_id: child.id
  )
  milestone_records << milestone
end

milestone_records += [
  Milestone.create!(title: "Rolled Over", milestone_type: "Motor", child: child_records[0]),
  Milestone.create!(title: "Started Crawling", milestone_type: "Motor", child: child_records[1]),
  Milestone.create!(title: "First Birthday", milestone_type: "Social", child: child_records[2]),
]

puts "🌱 Seeding Entries..."

entries = [
  {
    milestone: milestone_records[0],
    note: "Big smile after bath time!",
    date: Date.new(2022, 3, 1),
    age_months: 2,
  },
  {
    milestone: milestone_records[1],
    note: "Said 'mama' for the first time at dinner!",
    date: Date.new(2022, 8, 15),
    age_months: 10,
  },
  {
    milestone: milestone_records[2],
    note: "Took 3 steps toward the couch!",
    date: Date.new(2023, 1, 10),
    age_months: 12,
  },
  {
    milestone: milestone_records[3],
    note: "Slept through the night for 8 hours!",
    date: Date.new(2023, 2, 18),
    age_months: 6,
  },
  {
    milestone: milestone_records[4],
    note: "First little white tooth poking through!",
    date: Date.new(2022, 6, 9),
    age_months: 7,
  },
]

entries.each { |attrs| Entry.create!(attrs) }

puts "🫡 Done seeding!"
