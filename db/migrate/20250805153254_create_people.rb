class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :attendee_name
      t.timestamps
    end
  end
end
