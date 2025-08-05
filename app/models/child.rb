class Child < ActiveRecord::Base
  has_many :entries
  has_many :milestones, through: :entries
end
