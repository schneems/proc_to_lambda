# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proc_to_lambda/version'

Gem::Specification.new do |gem|
  gem.name          = "resque_def"
  gem.version       = ProcToLambda::VERSION
  gem.authors       = ["Richard Schneeman"]
  gem.email         = ["richard.schneeman+rubygems@gmail.com"]
  gem.description   = %q{ Turn your procs to lambdas in no time }
  gem.summary       = %q{ Turn your procs to lambdas in less time than you can read this sentence. }
  gem.homepage      = "https://github.com/schneems/proc_to_lambda"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end

