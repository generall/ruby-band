# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ruby-band/version'

Gem::Specification.new do |spec|
  spec.name = "ruby-band"
  spec.version = RubyBand::VERSION

  spec.require_paths    = ["lib"]
  spec.authors          = ["arrigonialberto86"]
  spec.date             = "2014-10-21"
  spec.description      = "Data mining and machine learning algorithms for JRuby"
  spec.summary          = "Data mining and machine learning algorithms for JRuby"
  spec.email            = "arrigonialberto86@gmail.com"
  spec.extensions       = ["Rakefile"]
  spec.extra_rdoc_files = ["LICENSE.txt", "README.md", "README.rdoc"]
  spec.files            = `git ls-files -z`.split("\x0") + Dir['jars/**/*']

  spec.add_runtime_dependency "atomic", "~> 1.1"
  spec.add_runtime_dependency "activesupport", "~> 4.1"
  spec.add_runtime_dependency "bio", "~> 1.4"
  spec.add_runtime_dependency "ruport", "~> 1.6"
  spec.add_runtime_dependency "lock_jar", "~> 0.10"

  spec.add_development_dependency "git", "~> 1.2"
  spec.add_development_dependency "rdoc", "~> 4.1"
  spec.add_development_dependency "rake", "~> 10.3"

  spec.add_development_dependency "shoulda", "~> 3.5"
  spec.add_development_dependency "test-unit", "~> 2.5"
  spec.add_development_dependency "simplecov", "~> 0.9"
  spec.add_development_dependency "cucumber", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end

