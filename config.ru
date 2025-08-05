require_relative "config/environment"
require "./app/controllers/application_controller"
require "./app/controllers/children_controller"
require "./app/controllers/milestones_controller"
require "./app/controllers/entries_controller"

# Allow CORS (Cross-Origin Resource Sharing) requests
use Rack::Cors do
  allow do
    origins "*"
    resource "*", headers: :any, methods: %i[get post delete put patch options head]
  end
end

# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser

# Mount modular controllers
use ChildrenController
use MilestonesController
use EntriesController

# Our application
run ApplicationController
