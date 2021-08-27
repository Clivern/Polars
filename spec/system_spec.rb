# frozen_string_literal: true

#
# Polars - A Unified SDK for Linux OS Distributions in Ruby
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

require "polars/system"

RSpec.describe("polars.command") do
  it "command instance is not nil" do
    expect(Polars::Command.new("echo Hey")).not_to(be(nil))
  end

  it "result is zero" do
    expect(Polars::Command.new("echo Hey").run).to(eq(0))
  end

  it "attr reader have valid values" do
    cmd = Polars::Command.new("echo Hey")
    expect(cmd.run).to(eq(0))
    expect(cmd.output).to(eq("Hey\n"))
    expect(cmd.command_line).to(eq("echo Hey"))
    expect(cmd.error).to(eq(""))
  end
end
