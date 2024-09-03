# frozen_string_literal: true

require_relative "config/environment"

# Allow CORS (Cross-Origin Resource Sharing) requests
use Rack::Cors do
  allow do
    origins "*"
    resource "*", headers: :any, methods: %i[get post delete put patch options head]
  end
end

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser

# Ensure that the environment and all models are loaded
require_relative './models/run'
require_relative './models/runner'
require_relative './models/shoe'

# Our application
run ApplicationController
