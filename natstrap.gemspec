# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'natstrap/version'

Gem::Specification.new do |gem|
  gem.name          = "natstrap"
  gem.version       = Natstrap::VERSION
  gem.authors       = ["Nat Welch"]
  gem.email         = ["nat@natwelch.com"]
  gem.homepage      = "http://github.com/icco/basic"
  gem.licenses = ['MIT']

  gem.summary       = %q{A gem to create a new project for Nat.}
  gem.description   = %q{A gem to create a new project for Nat. Follows a consistent app template using padrino and bootstrap.}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "bundler"
  gem.add_runtime_dependency "git"
  gem.add_runtime_dependency "fog"
  gem.add_runtime_dependency "padrino", "0.11.2"
  gem.add_runtime_dependency "rake"
  gem.add_runtime_dependency "thor"
  gem.add_runtime_dependency "zipruby"

  gem.rdoc_options = ['--charset=UTF-8']
end
