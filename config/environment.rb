# Set the environment (development, test, or production)
ENV["RACK_ENV"] ||= "development"

# Require in Gems
require "bundler/setup"
Bundler.require(:default, ENV.fetch("RACK_ENV", nil))

# Set up database connection
set :database,
    { adapter: "sqlite3", database: "db/#{ENV.fetch('RACK_ENV', 'development')}.sqlite3" }

# Require in all files in 'app' directory
require_all "app"

# Explicitly require models
require_relative "../app/models/owner"
require_relative "../app/models/pet"
