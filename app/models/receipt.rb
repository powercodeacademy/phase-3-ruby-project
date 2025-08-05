class Receipt < ActiveRecord::Base 
  belongs_to :store 
  has_many :items 
end
