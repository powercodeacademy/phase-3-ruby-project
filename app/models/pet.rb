class Pet < ActiveRecord::Base
  belongs_to :owner

  validates :name, presence: true
  validates :species, presence: true
  validates :breed, presence: true
  validates :age, numericality: { greater_than: 0, only_integer: true }
end
