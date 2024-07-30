class Shoe < ActiveRecord::Base
  has_many :runs
  belongs_to :runner

  def mileage
    runs.sum(:distance)
  end
end
