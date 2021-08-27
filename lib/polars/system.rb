# frozen_string_literal: true

#
# Polars - A Ruby SDK to Work With Different Linux Distributions
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

require "awesome_spawn"

# Polars Module
module Polars
  # Command Class
  class Command
    def initialize(command)
      @command = command
    end

    def run
      result = AwesomeSpawn.run(@command)
      @exit_status = result.exit_status
      @command_line = result.command_line
      @output = result.output
      @error = result.error
      @exit_status
    end

    attr_reader :exit_status
    attr_reader :command_line
    attr_reader :output
    attr_reader :error
  end
end
