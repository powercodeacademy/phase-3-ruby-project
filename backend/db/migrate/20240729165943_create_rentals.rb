class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.references :customer, foreign_key: true
      t.references :tool, foreign_key: true
      t.date :date_out
      t.date :date_in

      t.timestamps
    end
  end
end
