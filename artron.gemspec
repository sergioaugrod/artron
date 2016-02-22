# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'artron/version'

Gem::Specification.new do |spec|
  spec.name          = "artron"
  spec.version       = Artron::VERSION
  spec.authors       = ["Sérgio Rodrigues"]
  spec.email         = ["sergioaugrod@gmail.com"]

  spec.summary       = %q{Communicates with sensors(temperature and luminosity) connected to an Arduino and publishes to a MQTT broker.}
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.9.0"
  spec.add_development_dependency "artoo-arduino", "~> 1.4.4"
  spec.add_development_dependency "mqtt", "~> 0.3.1"
  spec.add_development_dependency "rspec-its", "~> 1.2.0"
end
