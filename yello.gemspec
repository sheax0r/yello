# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yello/version'

Gem::Specification.new do |spec|
  spec.name          = 'yello'
  spec.version       = Yello::VERSION
  spec.authors       = ['Mike Shea']
  spec.email         = ['mike.shea@gmail.com']
  spec.summary       = %q{Yaml to trello}
  spec.homepage      = "http://github.com/sheax0r/yello"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~>3.0'
  spec.add_development_dependency 'simplecov', '~> 0.9'
  spec.add_development_dependency 'pry', '~> 0.10'

  spec.add_dependency 'highline', '~> 1.6'
  spec.add_dependency 'os', '~> 0.9'
  spec.add_dependency 'rest-client', '~> 1.7'
  spec.add_dependency 'ruby-trello', '~> 1.1'
  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'netrc', '~> 0.8'
end
