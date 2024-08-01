class Runner < ActiveRecord::Base
  has_many :runs
  has_many :shoes

  def mileage
    runs.sum(:distance)
  end

  def shoe_count
    shoes.count
  end

  def average_calories_burned
    runs.average(:calories_burned).to_f
  end

  def shoe_stats
    shoes.to_a.map do |shoe|
      shoe.attributes.merge(runs: shoe.runs, mileage: shoe.mileage)
    end
  end

  def total_steps
    runs.sum { |run| run.cadence * run.total_time_minutes }
  end

  def favorite_shoes
    favorite_shoe = shoes.max_by(&:mileage)
    if favorite_shoe
      favorite_shoe.name
    else
      "Go for a run to track your favorite shoes."
    end
  end

  def title
    case mileage
    when 0...20
      "Aspiring Runner - #{20 - mileage} More miles until 'Determined Sprinter'"
    when 20...45
      "Determined Sprinter - #{45 - mileage} More miles until 'Fearless Pacer'"
    when 45...60
      "Fearless Pacer - #{60 - mileage} More miles until 'Heroic Marathoner'"
    when 60...75
      "Heroic Marathoner - #{75 - mileage} More miles until 'Legendary Conqueror'"
    else
      "Legendary Conqueror"
    end
  end

  def rank
    runners_ranked = Runner.all.sort_by(&:mileage).reverse
    position = runners_ranked.index(self)
    case position
    when 0
      "first"
    when 1
      "second"
    when 2
      "third"
    else
      "#{position + 1}th"
    end
  end

  def stats
    ["Title: #{title} - You are currently ranked #{rank} among all runners.",
     "Total Miles Run: #{mileage}",
     "Pairs of shoes owned: #{shoe_count}",
     "Average Calories Burned Per Run: #{average_calories_burned}",
     "Total Steps Taken: #{total_steps}",
     "Favorite Shoes: #{favorite_shoes}",]
  end
end
