# frozen_string_literal: true

$LOAD_PATH.push File.join(File.dirname(__FILE__), "lib")
require "enigma/version"

Gem::Specification.new do |spec|
  spec.name        = "enigma"
  spec.version     = Enigma::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ["Kevin Sylvestre"]
  spec.email       = ["kevin@ksylvest.com"]
  spec.executables = ["enigma"]
  spec.homepage    = "https://github.com/ksylvest/enigma"
  spec.summary     = "An enigma machine"
  spec.description = "Enigma is a simulation of a physical enigma machine."
  spec.files       = Dir.glob("{bin,lib}/**/*") + %w[README.md LICENSE Gemfile]

  spec.required_ruby_version = ">= 4.0"

  spec.add_dependency "slop"
  spec.metadata["rubygems_mfa_required"] = "true"
end
