# -*- encoding: utf-8 -*-
$:.push File.join(File.dirname(__FILE__), 'lib')
require "enigma/version"

Gem::Specification.new do |s|
  s.name        = "enigma"
  s.version     = Enigma::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kevin Sylvestre"]
  s.email       = ["kevin@ksylvest.com"]
  s.homepage    = "https://github.com/ksylvest/enigma"
  s.summary     = "An enigma machine"
  s.description = "Enigma is a simulation of a physical enigma machine."
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(README.rdoc LICENSE Gemfile)
  
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "bundler"
end
