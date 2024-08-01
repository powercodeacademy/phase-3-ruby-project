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

  get "/runners" do
    return_runners
  end

  post "/shoes" do
    Shoe.create(
      name: params[:name],
      runner_id: params[:runnerId]
    )
    return_runners
  end

  post "/runners" do
    Runner.create(
      name: params[:name]
    )
    return_runners
  end

  post "/runs" do
    Run.create_random(params[:runnerId], params[:shoeId])
    return_runners
  end

  patch "/runs/:id" do
    run = Run.find(params[:id])
    run.update(
      shoe_id: params[:shoeID]
    )
    return_runners
  end

  delete "/runs/:id" do
    run = Run.find(params[:id])
    run.destroy
    return_runners
  end
end
