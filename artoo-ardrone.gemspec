# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "artoo-ardrone/version"

Gem::Specification.new do |s|
  s.name        = "artoo-ardrone"
  s.version     = Artoo::Ardrone::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ron Evans", "Adrian Zankich"]
  s.email       = ["artoo@hybridgroup.com"]
  s.homepage    = "https://github.com/hybridgroup/artoo-ardrone"
  s.summary     = %q{Artoo adaptor and driver for Parrot ARDrone 2.0}
  s.description = %q{Artoo adaptor and driver for Parrot ARDrone 2.0}

  s.rubyforge_project = "artoo-ardrone"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'artoo', '~> 1.1.0.pre'
  #s.add_runtime_dependency 'argus', '~> 0.3.0'
  s.add_runtime_dependency 'argus'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'minitest-happy'
  s.add_development_dependency 'mocha', '~> 0.14.0'
end
