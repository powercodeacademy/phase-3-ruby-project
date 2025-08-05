class CreateReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :receipts do |t| 
      t.string :date 
      t.integer :store_id 
      t.timestamps
    end
  end
end
