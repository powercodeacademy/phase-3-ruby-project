require 'pry'

RSpec.describe Runner, type: :model do
  let(:runner) { Runner.create(name: "Test Runner") }

  let!(:shoe1) { Shoe.create(name: "Nike Air", runner: runner) }
  let!(:shoe2) { Shoe.create(name: "Adidas Boost", runner: runner) }

  let!(:run1) do
    Run.create(
      runner: runner,
      shoe: shoe1,
      distance: 5,
      cadence: 180,
      average_heart_rate: 150,
      average_pace: 6.0,
      calories_burned: 300,
      total_time_minutes: 30
    )
  end

  let!(:run2) do
    Run.create(
      runner: runner,
      shoe: shoe1,
      distance: 10,
      cadence: 180,
      average_heart_rate: 155,
      average_pace: 6.5,
      calories_burned: 600,
      total_time_minutes: 60
    )
  end

  let!(:run3) do
    Run.create(
      runner: runner,
      shoe: shoe2,
      distance: 15,
      cadence: 180,
      average_heart_rate: 160,
      average_pace: 7.0,
      calories_burned: 900,
      total_time_minutes: 90
    )
  end

  describe '#mileage' do
    it 'returns the total distance run by the runner' do
      expect(runner.mileage).to eq(30)  # 5 + 10 + 15
    end
  end

  describe '#shoe_count' do
    it 'returns the number of shoes owned by the runner' do
      expect(runner.shoe_count).to eq(2)
    end
  end

  describe '#average_calories_burned' do
    it 'returns the average calories burned per run' do
      expect(runner.average_calories_burned).to eq(600.0)
    end
  end

  describe '#shoe_stats' do
    it 'returns a list of shoe stats including runs and mileage' do
      shoe_stats = runner.shoe_stats
      expect(shoe_stats.length).to eq(2)
      expect(shoe_stats.first[:runs].length).to eq(2)
      expect(shoe_stats.first[:mileage]).to eq(15)
    end
  end

  describe '#total_steps' do
    it 'returns the total steps taken by the runner' do
      total_steps = (180 * 30) + (180 * 60) + (180 * 90)
      expect(runner.total_steps).to eq(total_steps)
    end
  end

  describe '#favorite_shoes' do
    it 'returns the name of the shoe with the most mileage' do
      expect(runner.favorite_shoes).to eq("Nike Air")
    end
  end

  describe '#title' do
    it 'returns the correct title based on mileage' do
      expect(runner.title).to include("Determined Sprinter - 15 More miles until 'Fearless Pacer'")
    end
  end

  describe '#rank' do
    it 'returns the correct rank among all runners' do
      another_runner = Runner.create(name: "Another Runner")
      Run.create(
        runner: another_runner,
        shoe: shoe1,
        distance: 40,
        cadence: 180,
        average_heart_rate: 160,
        average_pace: 7.0,
        calories_burned: 1000,
        total_time_minutes: 60
      )
      allow(Runner).to receive(:all).and_return([runner, another_runner])
      expect(runner.rank).to eq("second")
    end
  end

  describe '#stats' do
    it 'returns the correct summary stats for the runner' do
      expect(runner.stats).to include("Title: Determined Sprinter - 15 More miles until 'Fearless Pacer' - You are currently ranked first among all runners.")
      expect(runner.stats).to include("Total Miles Run: 30")
      expect(runner.stats).to include("Pairs of shoes owned: 2")
      expect(runner.stats).to include("Average Calories Burned Per Run: 600.0")
      expect(runner.stats).to include("Total Steps Taken: 32400")
      expect(runner.stats).to include("Favorite Shoes: Nike Air")
    end
  end
end
