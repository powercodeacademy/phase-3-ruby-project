class Customer < ActiveRecord::Base
  has_many :rentals
  has_many :tools, through: :rentals

  # def amount_owed
  #   rentals.sum do |rental|
  #     rental_end_date = rental.date_in
  #     (rental_end_date - rental.date_out).to_i * rental.tool.price_per_day
  #   end
  # end
end
