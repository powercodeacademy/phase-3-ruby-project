class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.string :front
      t.text :back
      t.references :deck, foreign_key: true, null: false
      t.timestamps
    end
  end
end
