# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/eveonline/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-eveonline"
  spec.version       = Omniauth::Eveonline::VERSION
  spec.authors       = ["r_nishio"]
  spec.email         = ["quick.xp@me.com"]
  spec.summary       = 'Eve Online OAuth2 Strategy for OmniAuth'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'
  spec.add_development_dependency "rake"
end
