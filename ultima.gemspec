# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ultima/version'

Gem::Specification.new do |spec|
  spec.name          = 'ultima'
  spec.version       = Ultima::VERSION
  spec.authors       = ['Maxime Buffa']
  spec.email         = ['mbuffa@gmail.com']

  spec.summary       = 'A work-in-progress dungeon crawler written in Ruby.'
  spec.description   = 'A work-in-progress dungeon crawler written in Ruby.'
  spec.homepage      = 'https://github.com/mbuffa/ultima'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'

  spec.add_dependency 'gosu'
end
