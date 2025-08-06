class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/" do
    { message: "Track Your Concerts!" }.to_json
  end
end
