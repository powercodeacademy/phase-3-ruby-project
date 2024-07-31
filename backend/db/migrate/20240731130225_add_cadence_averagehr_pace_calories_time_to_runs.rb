class AddCadenceAveragehrPaceCaloriesTimeToRuns < ActiveRecord::Migration[6.1]
  def change
    add_column :runs, :cadence, :integer
    add_column :runs, :average_heart_rate, :integer
    add_column :runs, :average_pace, :decimal
    add_column :runs, :calories_burned, :integer
    add_column :runs, :total_time_minutes, :integer
  end
end
