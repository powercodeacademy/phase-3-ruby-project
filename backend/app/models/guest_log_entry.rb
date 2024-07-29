class GuestLogEntry < ActiveRecord::Base
  belongs_to :bnb
  belongs_to :guest
  belongs_to :stay
end
