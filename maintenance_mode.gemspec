# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'maintenance_mode/version'

Gem::Specification.new do |spec|
  spec.name          = "maintenance_mode"
  spec.version       = MaintenanceMode::VERSION
  spec.authors       = ["Adam Musial-Bright"]
  spec.summary       = %q{Simple maintenance mode for production rails apps.}
  spec.description   = %q{Use simple model and before filter to activate the maintenance mode.}
  spec.homepage      = "https://github.com/musial-bright"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'
  spec.add_dependency 'activemodel'
  spec.add_dependency 'activerecord'
  spec.add_dependency 'acts_as_singleton'
  
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'sqlite3'
end
