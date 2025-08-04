class CreateCardTags < ActiveRecord::Migration[8.0]
  def change
    create_table :card_tags do |t|
      t.references :card, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false
      t.timestamps
    end
  end
end
