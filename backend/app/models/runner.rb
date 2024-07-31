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

  def stats
    ["Total Miles Run: #{mileage}", "Pairs of shoes owned: #{shoe_count}",
     "Average Calories Burned Per Run: #{average_calories_burned}",]
  end
end
