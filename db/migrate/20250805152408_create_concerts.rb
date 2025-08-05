class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.string :band_name
      t.date :event_date
      t.string :venue
      t.string :city
      t.timestamps
    end
  end
end
