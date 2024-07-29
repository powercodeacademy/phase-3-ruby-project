class CreateGuestLogEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :guest_log_entries do |t|
      t.references :bnb
      t.references :guest
      t.references :stay
      t.string :message

      t.timestamps
    end
  end
end
