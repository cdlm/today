# -*- encoding: utf-8 -*-

require File.expand_path('../lib/today/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "today"
  gem.version       = Today::VERSION
  gem.summary       = %q{Log your tasks & accomplishments from the terminal.}
  gem.description   = %q{Today is a command-line tool to quickly log your actions, tasks, accomplishments, allowing you to keep a trace and retrieve what you've done.}
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
