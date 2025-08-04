class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t| 
      t.string :name 
      t.integer :price
      t.integer :receipt_id 
      t.integer :store_id 
      t.timestamps
    end
  end
end
