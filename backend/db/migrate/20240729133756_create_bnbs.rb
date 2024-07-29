class CreateBnbs < ActiveRecord::Migration[6.1]
  def change
    create_table :bnbs do |t|
      t.string :name
      t.string :location
      t.integer :num_of_rooms
      t.integer :cost_per_night
      t.string :description

      t.timestamps
    end
  end
end
