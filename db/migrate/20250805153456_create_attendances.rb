class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.boolean :ticket_purchased, default: false
      t.integer :concert_id
      t.integer :attendance_id
      t.timestamps
    end
  end
end
