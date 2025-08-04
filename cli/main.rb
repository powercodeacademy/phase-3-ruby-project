#!/usr/bin/env ruby

require "tty-prompt"
require_relative "lib/cli_interface"

# Run the CLI application
CLIInterface.new.run if __FILE__ == $PROGRAM_NAME
