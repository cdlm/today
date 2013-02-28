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

  gem.add_runtime_dependency 'cri', '~> 2.3'
  gem.add_runtime_dependency 'chronic', '~> 0.9'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'kramdown'
end
