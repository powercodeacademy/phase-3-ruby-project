class Bnb < ActiveRecord::Base
  has_many :stays
  has_many :guests, through: :stays
  has_many :guest_log_entries, through: :stays

  def total_revenue
    cost_per_night * stays.count
  end

  def daily_projections
    num_of_rooms * cost_per_night
  end

  def avg_guest_age
    total = 0
    guests.map do |guest|
      total += guest.age
    end
    avg_age = total / guests.count
    avg_age
  end

  def bnb_activity
    if avg_guest_age >= 30 && avg_guest_age < 55
      "Guided hiking tours"
    elsif avg_guest_age < 30
      "Group hoverboard lessons"
    elsif avg_guest_age >= 55
        "Nightly bingo"
    end
  end

  def self.most_popular
    order(stays: :asc)
  end
end
