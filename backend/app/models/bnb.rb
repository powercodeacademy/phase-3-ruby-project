class Bnb < ActiveRecord::Base
  has_many :stays
  has_many :guests, through: :stays
  has_many :guest_log_entries, through: :stays
end
