class Rental < ActiveRecord::Base
  belongs_to :tool
  belongs_to :customer
end
