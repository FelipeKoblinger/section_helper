# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'section_helper/version'

Gem::Specification.new do |spec|
  spec.name          = 'section_helper'
  spec.version       = SectionHelper::VERSION
  spec.authors       = ['Felipe Koblinger']
  spec.email         = ['koblinger@live.com']

  spec.summary       = %q{This is a very simple gem to use with Bootstrap 3 panels.}
  spec.description   = %q{This gem contains a helper method to generate panels with tables inside.}
  spec.homepage      = 'https://github.com/FelipeKoblinger/section_helper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 4.0.0', '< 4.3.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-nc'
  spec.add_development_dependency 'rspec-html-matchers'
end