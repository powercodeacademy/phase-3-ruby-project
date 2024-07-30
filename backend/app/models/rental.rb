class Rental < ActiveRecord::Base
  belongs_to :tool
  belongs_to :customer

  # def amount_owed
  #   rentals.where.not(date_in: nil).sum do |rental|
  #     rental_end_date = rental.date_in
  #     (rental_end_date - rental.date_out).to_i * rental.tool.price_per_day
  #   end
  # end
end
