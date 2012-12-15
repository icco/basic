# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'natstrap/version'

Gem::Specification.new do |gem|
  gem.name          = "natstrap"
  gem.version       = Natstrap::VERSION
  gem.authors       = ["Nat Welch"]
  gem.email         = ["nat@natwelch.com"]
  gem.description   = %q{A gem to create a new project for Nat.}
  gem.summary       = %q{A gem to create a new project for Nat.}
  gem.homepage      = "http://github.com/icco/basic"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "bundler"
  gem.add_runtime_dependency "padrino"
  gem.add_runtime_dependency "fog"
end
