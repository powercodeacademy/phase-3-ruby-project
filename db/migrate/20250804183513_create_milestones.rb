class CreateMilestones < ActiveRecord::Migration[6.1]
  def change
    create_table :milestones do |t|
      t.references :child, foreign_key: true
      t.string :title
      t.string :milestone_type

      t.timestamps
    end

  end
end
