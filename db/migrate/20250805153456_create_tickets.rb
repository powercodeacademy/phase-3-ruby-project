class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :concert_id
      t.integer :user_id
      t.timestamps
    end
  end
end
