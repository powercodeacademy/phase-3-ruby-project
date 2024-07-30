class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/" do
    "Hello World"
  end

  get "/runners" do
    runners = Runner.all.map do |runner|
      {
        id: runner.id,
        name: runner.name,
        shoes: runner.shoes,
        runs: runner.runs,
      }
    end
    runners.to_json
  end

  post "/shoes" do
    shoe = Shoe.create(
      name: params[:name],
      mileage: 0,
      runner_id: params[:runnerId]
    )
    shoe.to_json
  end

  post "/runners" do
    runner = Runner.create(
      name: params[:name]
    )
    runner.to_json
  end

  post "/runs" do
    run = Run.create(
      distance: params[:distance],
      runner_id: params[:runnerId],
      shoe_id: params[:shoeID]
    )
    run.to_json
  end

  patch "/runs/:id" do
    run = Run.find(params[:id])
    run.update(
      distance: params[:distance]
    )
    run.to_json
  end

  delete "/runs/:id" do
    run = Run.find(params[:id])
    run.destroy
    run.to_json
  end
end
