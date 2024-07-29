class CreateShoes < ActiveRecord::Migration[6.1]
  def change
    create_table :shoes do |t|
      t.references :runner, foreign_key: true
      t.string :name
      t.integer :mileage

      t.timestamps
    end
  end
end
