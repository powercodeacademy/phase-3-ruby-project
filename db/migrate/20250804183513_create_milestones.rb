class CreateMilestones < ActiveRecord::Migration[6.1]
  def change
    create_table :milestones do |t|
      t.string :title
      t.string :milestone_type

      t.timestamps
    end

  end
end
