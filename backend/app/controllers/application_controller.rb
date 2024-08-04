class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  def return_runners
    runners = Runner.all.map do |runner|
      {
        id: runner.id,
        name: runner.name,
        shoes: runner.shoe_stats,
        runs: runner.runs,
        stats: runner.stats,
      }
    end
    runners.to_json
  end

  def return_runner(runner)
    updated_runner = {
      id: runner.id,
      name: runner.name,
      shoes: runner.shoe_stats,
      runs: runner.runs,
      stats: runner.stats,
    }

    updated_runner.to_json
  end

  get "/runners" do
    return_runners
  end

  post "/shoes" do
    runner = Runner.find(params[:runnerId])
    Shoe.create(
      name: params[:name],
      runner_id: params[:runnerId]
    )
    return_runner(runner)
  end

  post "/runners" do
    runner = Runner.create(
      name: params[:name]
    )
    return_runner(runner)
  end

  post "/runs" do
    runner = Runner.find(params[:runnerId])
    Run.create_random(params[:runnerId], params[:shoeId])
    return_runner(runner)
  end

  patch "/runs/:id" do
    run = Run.find(params[:id])
    run.update(
      shoe_id: params[:shoeId]
    )
    runner = Runner.find(run.runner_id)
    return_runner(runner)
  end

  delete "/runs/:id" do
    run = Run.find(params[:id])
    run.destroy
    return_runner(run.runner)
  end
end
