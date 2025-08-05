class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.references :milestone, foreign_key: true
      t.references :child, foreign_key: true
      t.text :note
      t.date :date
      t.integer :age_months

      t.timestamps
    end

  end
end
