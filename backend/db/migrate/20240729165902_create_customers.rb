class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :phone_number
      t.string :email_address
      t.decimal :current_amount_owed, precision: 8, scale: 2, default: 0.0

      t.timestamps
    end
  end
end
