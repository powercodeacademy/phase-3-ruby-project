class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :species, null: false
      t.string :breed, null: false
      t.integer :age, null: false
      t.text :notes
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
