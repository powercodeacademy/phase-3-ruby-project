class Bnb < ActiveRecord::Base
  has_many :stays
  has_many :guests, through: :stays
  has_many :guest_log_entries, through: :stays

  def total_revenue
    cost_per_night * stays.count
  end

  def daily_projection
    num_of_rooms * cost_per_night
  end

  def avg_guest_age
    total = 0
    guests.map do |guest|
      total += guest.age
    end
    total / guests.count
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
    joins(:stays)
      .group("bnbs.id")
      .order("COUNT(stays.id) DESC")
  end

  def revenue_forcasting
    daily_projection
    weekly_projection = daily_projection * 7
    monthly_projection = daily_projection * 30
    annual_projection = daily_projection * 365

    {
      daily_projection: daily_projection,
      weekly_projection: weekly_projection,
      monthly_projection: monthly_projection,
      annual_projection: annual_projection,
    }
  end
end
