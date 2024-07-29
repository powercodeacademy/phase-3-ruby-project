class Shoe < ActiveRecord::Base
  has_many :run
  belongs_to :runner

end
