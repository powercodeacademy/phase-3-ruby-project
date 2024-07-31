class Bnb < ActiveRecord::Base
  has_many :stays
  has_many :guests, through: :stays
  has_many :guest_log_entries, through: :stays

  def total_revenue
    cost_per_night * stays.count
  end
end
