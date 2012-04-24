# -*- encoding: utf-8 -*-
require File.expand_path('../lib/quotefm/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Moritz Kröger"]
  gem.email         = ["moritz.kroeger@googlemail.com"]
  gem.description   = "Unofficial Wrapper for the Quote.fm REST API"
  gem.summary       = "Wraps all functions of the Quote.fm REST API into Ruby Objects and returns its responses"
  gem.homepage      = "http://github.com/mcrip/quotefm"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "quotefm"
  gem.require_paths = ["lib"]
  gem.version       = Quotefm::VERSION

  gem.add_dependency "httparty"
  gem.add_development_dependency "fakeweb", "~> 1.3"
  gem.add_development_dependency "rspec", "~> 2.9"
  gem.add_development_dependency "gem-release"
end
