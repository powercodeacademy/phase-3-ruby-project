class Milestone < ActiveRecord::Base
  has_many :entries
  has_many :children, through: :entries
end
