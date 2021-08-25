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

require "scone/ubuntu/stat"

RSpec.describe "scone.ubuntu.stat" do
  it "stats instance is not nil" do
    result = Scone::Ubuntu::Stat.new("#{Dir.pwd}/cache/proc.stat.txt")
    expect(result).not_to be nil
  end

  it "validate `cache/proc.stat.txt` values" do
    result = Scone::Ubuntu::Stat.new("#{Dir.pwd}/cache/proc.stat.txt").proc_stat
    expect(result[:cpu][:user]).to eq(70_188)
    expect(result[:cpu][:nice]).to eq(0)
    expect(result[:cpu][:system]).to eq(10_456)
    expect(result[:cpu][:idle]).to eq(2_238_527)
    expect(result[:cpu][:iowait]).to eq(10_766)
    expect(result[:cpu][:irq]).to eq(0)
    expect(result[:cpu][:softirq]).to eq(271)
    expect(result[:cpu][:steal]).to eq(199)
    expect(result[:cpu][:guest]).to eq(0)
    expect(result[:cpu][:guest_nice]).to eq(0)
    expect(result[:cpu0][:user]).to eq(70_188)
    expect(result[:cpu0][:nice]).to eq(0)
    expect(result[:cpu0][:system]).to eq(10_456)
    expect(result[:cpu0][:idle]).to eq(2_238_527)
    expect(result[:cpu0][:iowait]).to eq(10_766)
    expect(result[:cpu0][:irq]).to eq(0)
    expect(result[:cpu0][:softirq]).to eq(271)
    expect(result[:cpu0][:steal]).to eq(199)
    expect(result[:cpu0][:guest]).to eq(0)
    expect(result[:cpu0][:guest_nice]).to eq(0)
    expect(result[:ctxt]).to eq(6_808_805)
    expect(result[:btime]).to eq(1_635_081_048)
    expect(result[:processes]).to eq(5701)
    expect(result[:procs_running]).to eq(2)
    expect(result[:procs_blocked]).to eq(0)
  end
end
