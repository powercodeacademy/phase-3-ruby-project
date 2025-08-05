class Concert < ActiveRecord::Base
  has_many :attendances
  has_many :people, through: attendances
end
