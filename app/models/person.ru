class Person < ActiveRecord::Base
  has_many :attendances
  has_many :concerts, through: :attendances
end
