class Owner < ActiveRecord::Base
  has_many :pets, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
end
