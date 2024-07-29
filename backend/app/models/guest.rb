class Guest < ActiveRecord::Base
  has_many :stays
  has_many :bnbs, through: :stays
  has_many :guest_log_entries
end
