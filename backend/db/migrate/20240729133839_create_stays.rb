class CreateStays < ActiveRecord::Migration[6.1]
  def change
    create_table :stays do |t|
      t.references :bnb
      t.references :guest
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
