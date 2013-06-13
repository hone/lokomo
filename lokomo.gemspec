# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lokomo/version'

Gem::Specification.new do |spec|
  spec.name          = "lokomo"
  spec.version       = Lokomo::VERSION
  spec.authors       = ["Terence Lee"]
  spec.email         = ["hone02@gmail.com"]
  spec.description   = %q{Local buildpack runner}
  spec.summary       = %q{local buildpack runner}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.18.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
