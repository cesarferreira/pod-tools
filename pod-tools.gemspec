# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = 'pod-tools'
  spec.version       = PodTools::VERSION
  spec.authors       = ['cesar ferreira']
  spec.email         = ['cesar.manuel.ferreira@gmail.com']

  if spec.respond_to?(:metadata)
    #spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = 'Set of Cocoapods tools (clean, reinstall, clean derived data)'
  spec.description   = 'Pod tools'
  spec.homepage      = "https://github.com/cesarferreira/pod-tools"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_dependency 'bundler',  '>= 1.7'
  spec.add_dependency 'colorize',  '~> 0.7'
  spec.add_dependency 'cocoapods',  '>= 0.36'

end
