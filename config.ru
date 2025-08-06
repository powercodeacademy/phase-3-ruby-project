require_relative "config/environment"
require "./app/controllers/application_controller"
require "./app/controllers/children_controller"
require "./app/controllers/milestones_controller"
require "./app/controllers/entries_controller"

use Rack::Cors do
  allow do
    origins "*"
    resource "*", headers: :any, methods: %i[get post delete put patch options head]
  end
end

use Rack::JSONBodyParser

use ChildrenController
use MilestonesController
use EntriesController

run ApplicationController
