class Entry < ActiveRecord::Base
  belongs_to :child
  belongs_to :milestone
end
