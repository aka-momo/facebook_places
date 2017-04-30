# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'facebook_places/version'

Gem::Specification.new do |spec|
  spec.name          = 'facebook_places'
  spec.version       = FacebookPlaces::VERSION
  spec.authors       = ['Mohamed Diaa', 'Abanoub Aziz', 'Ramy Aboul Naga']
  spec.email         = ['mohamed.diaa27@gmail.com', 'abanoub.aziz92@gmail.com', 'ramy.naga@gmail.com']

  spec.summary       = 'A simple wrapper for Facebook Places APIs'
  spec.homepage      = 'https://github.com/mohameddiaa27/facebook_places'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'recursive-open-struct', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.0'
  spec.add_development_dependency 'simplecov', '~> 0.14.1'
  spec.add_development_dependency 'addressable', '~> 2.4.0'
  spec.add_development_dependency 'webmock',     '~> 2.3'
  spec.add_development_dependency 'vcr',         '~> 3.0'
end
