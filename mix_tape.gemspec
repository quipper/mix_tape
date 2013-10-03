# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mix_tape/version'

Gem::Specification.new do |spec|
  spec.name          = "mix_tape"
  spec.version       = MixTape::VERSION
  spec.authors       = ['Omar Sahyoun']
  spec.email         = ['omar@quipper.com']
  spec.description   = %q{Tidy up your mixpanel commits}
  spec.summary       = %q{Tidy up your mixpanel commits}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'

  spec.add_dependency 'mixpanel-ruby'
end
