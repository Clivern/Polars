# frozen_string_literal: true

#
# Scone - A Unified SDK for Linux OS Distributions in Ruby
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

# Scone Module
module Scone
  # Ubuntu Module
  module Ubuntu
    # Proc Stat Class
    class Stat
      def initialize(proc_stat = "/proc/stat")
        @hash = get_proc_stat_info(proc_stat)
      end

      def proc_stat
        @hash
      end

      private

      # Parse the information out of /proc/stat and assign keys and values to
      # a hash that can be accessed via the Forwardable module.
      def get_proc_stat_info(proc_stat)
        hash = {}

        File.readlines(proc_stat).each do |line|
          info = line.split

          next if info.empty?

          hash[info.first.to_sym] = if info.first =~ /^cpu/i
            {
              user: info[1].to_i,
              nice: info[2].to_i,
              system: info[3].to_i,
              idle: info[4].to_i,
              iowait: info[5].to_i,
              irq: info[6].to_i,
              softirq: info[7].to_i,
              steal: info[8].to_i,
              guest: info[9].to_i,
              guest_nice: info[10].to_i,
            }
          elsif info.size > 2
            info[1..].map { |e| e.to_i }
          else
            info[1].to_i
          end
        end
        hash
      end
    end
  end
end
