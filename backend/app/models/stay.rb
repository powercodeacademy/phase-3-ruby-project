class Stay < ActiveRecord::Base
  belongs_to :bnb
  belongs_to :guest
  has_one :guest_log_entry
end
