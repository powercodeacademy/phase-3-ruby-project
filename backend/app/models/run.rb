class Run < ActiveRecord::Base
  belongs_to :runner
  belongs_to :shoe

  def self.create_random(runner_id, shoe_id)
    run = {
      distance: rand(1..20),
      cadence: rand(150..200),
      average_heart_rate: rand(120..180),
      average_pace: rand(4.0..10.0).round(2),
      calories_burned: rand(200..1500),
      total_time_minutes: rand(30..180),
      runner_id: runner_id,
      shoe_id: shoe_id,
    }
    create(run)
  end
end
