class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.decimal :price_per_day, precision: 8, scale: 2
      t.string :phone_number
      t.boolean :availability, default: true
      t.string :category
      t.string :image

      t.timestamps
    end
  end
end
