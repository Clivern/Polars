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

require "scone/ubuntu/hardware"

RSpec.describe("scone.ubuntu.hardware") do
  it "hardware instance is not nil" do
    result = Scone::Ubuntu::Hardware.new
    expect(result).not_to(be(nil))
  end

  it "validate `cache/proc.cpuinfo.txt` values" do
    cores_count = Scone::Ubuntu::Hardware.new.total_cores("#{Dir.pwd}/cache/proc.cpuinfo.txt")
    expect(cores_count).to(eq(1))
  end
end
