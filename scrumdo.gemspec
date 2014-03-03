# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scrumdo/version'

Gem::Specification.new do |spec|
  spec.name          = 'scrumdo'
  spec.version       = Scrumdo::VERSION
  spec.authors       = [ 'Sander Nieuwenhuizen' ]
  spec.email         = 'snieuwen@gmail.com'
  spec.summary       = 'A ScrumDo ruby gem.'
  spec.description   = 'This gem acts as a client interface to the ScrumDo backlog management tool.'
  spec.homepage      = 'http://github.com/munkius/scrumdo'
  spec.licenses       = [ 'MIT' ]

  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'fakeweb', '~> 1.3'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'timecop', '~> 0.7.1'
end
