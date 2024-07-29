class Customer < ActiveRecord::Base
  has_many :rentals
  has_many :tools, through: :rentals
end
