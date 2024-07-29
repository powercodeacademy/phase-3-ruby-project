class CreateRuns < ActiveRecord::Migration[6.1]
  def change
    create_table :runs do |t|
      t.references :runner, foreign_key: true
      t.references :shoe, foreign_key: true
      t.integer :distance

      t.timestamps
    end
  end
end
