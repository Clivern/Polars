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

require_relative "lib/polars/version"

Gem::Specification.new do |spec|
  spec.name = "polars"
  spec.version = Polars::VERSION
  spec.authors = ["clivern"]
  spec.email = ["hello@clivern.com"]

  spec.summary = "A Ruby SDK to Work With Different Linux Distributions."
  spec.description = "A Ruby SDK to Work With Different Linux Distributions."
  spec.homepage = "https://github.com/Clivern/Polars"
  spec.license = "Apache-2.0"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Clivern/Polars"
  spec.metadata["changelog_uri"] = "https://github.com/Clivern/Polars/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    %x(git ls-files -z).split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency("awesome_spawn", "~> 1.5")
end
