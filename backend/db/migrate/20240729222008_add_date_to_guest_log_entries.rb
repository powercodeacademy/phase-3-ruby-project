class AddDateToGuestLogEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :guest_log_entries, :entry_date, :date
  end
end
