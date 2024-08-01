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
    shoes.max_by(&:mileage)
  end

  def stats
    ["Total Miles Run: #{mileage}",
     "Pairs of shoes owned: #{shoe_count}",
     "Average Calories Burned Per Run: #{average_calories_burned}",
     "Total Steps Taken: #{total_steps}",
     "Favorite Shoes: #{favorite_shoes.name}",]
  end
end
