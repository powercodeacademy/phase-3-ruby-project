class RemoveMileageFromShoes < ActiveRecord::Migration[6.1]
  def change
    remove_column :shoes, :mileage
  end
end
