# -*- encoding: utf-8 -*-

require File.expand_path('../lib/today/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "today"
  gem.version       = Today::VERSION
  gem.summary       = %q{TODO: Summary}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = ["Damien Pollet"]
  gem.email         = "damien.pollet@gmail.com"
  gem.homepage      = "https://github.com/cdlm/today#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'yard', '~> 0.8'
end
