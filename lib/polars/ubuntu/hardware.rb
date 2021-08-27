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

# Polars Module
module Polars
  # Ubuntu Module
  module Ubuntu
    # Hardware Class
    class Hardware
      # Get total cores
      def total_cores(proc_file = "/proc/cpuinfo")
        File.readlines(proc_file).count { |line| line =~ /^processor\s+:\s+\d+/ }
      end
    end
  end
end
