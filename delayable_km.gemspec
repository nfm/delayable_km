# -*- encoding: utf-8 -*-
require File.expand_path('../lib/delayable_km/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas Firth-McCoy"]
  gem.email         = ["nicholas@2suggestions.com.au"]
  gem.description   = %q{A minimal wrapper for the KISSmetrics API that can be used with delayed_job}
  gem.homepage      = "https://github.com/nfm/delayable_km"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "delayable_km"
  gem.require_paths = ["lib"]
  gem.version       = DelayableKm::VERSION

  gem.required_rubygems_version = '>= 1.3.6'
  gem.add_runtime_dependency 'httparty'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'yard'
end
