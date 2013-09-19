# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capuchin/version'

Gem::Specification.new do |spec|
  spec.name          = "capuchin"
  spec.version       = Capuchin::VERSION
  spec.authors       = ["Matt Swanson"]
  spec.email         = ["matt@mdswanson.com"]
  spec.description   = "Jekyll for email newsletters"
  spec.summary       = "Jekyll for email newsletters"
  spec.homepage      = "https://github.com/swanson/capuchin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "redcarpet"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-debugger"

end
