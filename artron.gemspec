# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'artron/version'

Gem::Specification.new do |spec|
  spec.name          = "artron"
  spec.version       = Artron::VERSION
  spec.authors       = ["Sérgio Rodrigues"]
  spec.email         = ["sergioaugrod@gmail.com"]

  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.9.0"
  spec.add_development_dependency "artoo-arduino", "~> 1.4.4"
  spec.add_development_dependency "mqtt", "~> 0.3.1"
  spec.add_development_dependency "rspec-its", "~> 1.2.0"
end
