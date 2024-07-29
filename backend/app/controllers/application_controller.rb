class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/" do
    "Hello World"
  end

  get "/runners" do
    runners = Runner.all.to_a.map do |runner|
      {
        id: runner.id,
        name: runner.name,
        shoes: runner.shoes,
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

  patch "/messages/:id" do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  delete "/messages/:id" do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
end
